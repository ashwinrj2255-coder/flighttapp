import 'package:flutter/material.dart' hide Route;
import 'package:flymate/feature/flight_details/presentation/viewmodel/payment_view_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../home/data/model/get_home_search_response_model.dart';
import '../../../home/presentation/view_model/home_view_model.dart';

class FlightDetailsPage extends StatelessWidget {
  const FlightDetailsPage({super.key});

  String _formatTime(DateTime? date) =>
      date == null ? '--:--' : DateFormat('HH:mm').format(date);

  String _formatDate(DateTime? date) =>
      date == null ? '--' : DateFormat('EEE, dd MMM yyyy').format(date);

  @override
  Widget build(BuildContext context) {
    final vm = context.read<HomeViewModel>();
    final flight = vm.selectedFlight;

    if (flight == null) {
      return const Scaffold(body: Center(child: Text("No flight details found")));
    }

    final routes = flight.route ?? [];
    final outboundLegs = routes.where((r) => r.routeReturn == 0).toList();
    final returnLegs = routes.where((r) => r.routeReturn == 1).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F9),
      appBar: AppBar(
        title: const Text("Review Itinerary",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. JOURNEY DETAILS
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (outboundLegs.isNotEmpty) ...[
                    _buildSectionTitle("Outbound Journey", outboundLegs.first.localDeparture),
                    _buildJourneyTimeline(outboundLegs),
                    const SizedBox(height: 24),
                  ],
                  if (returnLegs.isNotEmpty) ...[
                    _buildSectionTitle("Return Journey", returnLegs.first.localDeparture),
                    _buildJourneyTimeline(returnLegs),
                    const SizedBox(height: 24),
                  ],

                  const Text("Passenger & Info",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  _buildInfoGrid(flight, vm),
                  const SizedBox(height: 120), // Padding for Bottom Bar
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: _buildBottomAction(context, flight),
    );
  }

  Widget _buildSectionTitle(String title, DateTime? date) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(_formatDate(date), style: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.w600, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildJourneyTimeline(List<Route> legs) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: legs.length,
        itemBuilder: (context, index) {
          final r = legs[index];
          final isLast = index == legs.length - 1;

          // Calculate layover
          Widget? layoverWidget;
          if (!isLast) {
            final arrival = r.localArrival;
            final nextDeparture = legs[index + 1].localDeparture;
            if (arrival != null && nextDeparture != null) {
              final diff = nextDeparture.difference(arrival);
              layoverWidget = _buildLayoverBadge("${diff.inHours}h ${diff.inMinutes % 60}m layover in ${r.cityTo}");
            }
          }

          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Timeline Visuals
                  Column(
                    children: [
                      const Icon(Icons.radio_button_checked, size: 20, color: Color(0xFFE94D2B)),
                      Container(height: 60, width: 2, color: Colors.grey.shade200),
                    ],
                  ),
                  const SizedBox(width: 12),
                  // Flight Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${_formatTime(r.localDeparture)} · ${r.cityFrom} (${r.flyFrom})",
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                            _buildAirlineMiniLogo(r.airline ?? ""),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text("${r.airline} | Flight ${r.flightNo}",
                            style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                        const SizedBox(height: 16),
                        Text("${_formatTime(r.localArrival)} · ${r.cityTo} (${r.flyTo})",
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      ],
                    ),
                  ),
                ],
              ),
              if (layoverWidget != null) layoverWidget,
              // Final Destination Marker
              if (isLast)
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 20, color: Colors.indigo),
                    const SizedBox(width: 12),
                    const Text("Arrived at destination", style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLayoverBadge(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange.shade100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.access_time, size: 14, color: Colors.orange),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.orange, fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildAirlineMiniLogo(String code) {
    return Image.network(
      'https://pics.avs.io/80/40/$code.png',
      height: 20,
      errorBuilder: (_, __, ___) => Text(code, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildInfoGrid(Datum flight, HomeViewModel vm) {
    return Row(
      children: [
        _buildInfoCard("Baggage", "20 KG Included", Icons.luggage_outlined),
        const SizedBox(width: 12),
        _buildInfoCard("Cabin", vm.travelClass ?? "Economy", Icons.airline_seat_recline_normal),
      ],
    );
  }

  Widget _buildInfoCard(String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 20, color: Colors.indigo),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontSize: 11, color: Colors.grey)),
            Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomAction(BuildContext context, Datum flight) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, -4))],
      ),
      child: Row(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Total Price", style: TextStyle(color: Colors.grey, fontSize: 12)),
              Text("₹${flight.price?.toInt()}",
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 160,
            child: ElevatedButton(
              onPressed: () {
                context.read<PaymentViewModel>().startPayment(orderId: null, amount: flight.price!.toInt() * 100,);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE94D2B),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              child: const Text("Pay Now", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}