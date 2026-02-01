import 'package:intl/intl.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:flymate/feature/home/presentation/view_model/home_view_model.dart';
import 'package:provider/provider.dart';
import '../../../flight_details/presentation/view/flight_details_page.dart';
import '../../../home/data/model/get_home_search_response_model.dart';
import '../widgets/flight_shimmer_loading.dart';

class FlightSearchResultPage extends StatefulWidget {
  const FlightSearchResultPage({super.key});

  @override
  State<FlightSearchResultPage> createState() => _FlightSearchResultPageState();
}

class _FlightSearchResultPageState extends State<FlightSearchResultPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeViewModel>().searchFlights();
    });
  }

  String _formatTime(DateTime? date) {
    if (date == null) return '--:--';
    return DateFormat('HH:mm').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select<HomeViewModel, bool>((vm) => vm.isLoading);
    final error = context.select<HomeViewModel, String?>((vm) => vm.error);
    final flights = context.select<HomeViewModel, List<Datum>?>(
      (vm) => vm.searchResult?.data,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text(
          "Search Result",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: isLoading
          ? const FlightShimmerLoading()
          : error != null
              ? _buildErrorState(error)
              : (flights == null || flights.isEmpty)
                  ? const Center(child: Text("No flights found"))
                  : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: flights.length,
              itemBuilder: (context, index) {
                final flight = flights[index];
                final routes = flight.route ?? [];

                // Split legs using your model's 'routeReturn' field
                // 0 = Outbound, 1 = Return
                final outboundLegs = routes
                    .where((r) => r.routeReturn == 0)
                    .toList();
                final returnLegs = routes
                    .where((r) => r.routeReturn == 1)
                    .toList();

                final totalPrice = flight.price?.toInt() ?? 0;

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- OUTBOUND SECTION ---
                      if (outboundLegs.isNotEmpty) ...[
                        _buildSectionHeader(
                          "Outbound Flight",
                          outboundLegs.first,
                        ),
                        _buildJourneySummary(
                          outboundLegs,
                          flight.cityCodeFrom ?? '',
                          flight.cityCodeTo ?? '',
                        ),
                        _buildDetailedTimeline(outboundLegs),
                      ],

                      // --- RETURN SECTION (Round Trip Logic) ---
                      if (returnLegs.isNotEmpty) ...[
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Divider(color: Colors.black12, thickness: 1),
                        ),
                        _buildSectionHeader("Return Flight", returnLegs.first),
                        _buildJourneySummary(
                          returnLegs,
                          flight.cityCodeTo ?? '',
                          flight.cityCodeFrom ?? '',
                        ),
                        _buildDetailedTimeline(returnLegs),
                      ],

                      const SizedBox(height: 24),

                      // --- FOOTER: PRICE & ACTION ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Total Price",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 11,
                                ),
                              ),
                              Text(
                                '₹$totalPrice',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFE94D2B),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              // 1. Set the selected flight in the ViewModel
                              context.read<HomeViewModel>().selectFlight(
                                flight,
                              );

                              // 2. Navigate (No need to pass 'flight' in the constructor anymore!)
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const FlightDetailsPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Select",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }

  Widget _buildSectionHeader(String title, Route firstRoute) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.indigo.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.indigo,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          Text(
            firstRoute.localDeparture != null
                ? DateFormat('dd MMM yyyy').format(firstRoute.localDeparture!)
                : '--',
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildJourneySummary(List<Route> legs, String from, String to) {
    final first = legs.first;
    final last = legs.last;
    final stopCount = legs.length - 1;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          _buildTimeCity(
            _formatTime(first.localDeparture),
            from,
            CrossAxisAlignment.start,
          ),
          Expanded(child: _buildFlightDivider(stopCount)),
          _buildTimeCity(
            _formatTime(last.localArrival),
            to,
            CrossAxisAlignment.end,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedTimeline(List<Route> legs) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: legs.asMap().entries.map((entry) {
          final idx = entry.key;
          final r = entry.value;
          final airlineCode = r.airline ?? "SG"; // Default to SG if null

          return Padding(
            padding: EdgeInsets.only(bottom: idx == legs.length - 1 ? 0 : 12),
            child: Row(
              children: [
                // 1. TIMELINE LINE & DOT
                Column(
                  children: [
                    const Icon(Icons.circle, size: 8, color: Color(0xFFE94D2B)),
                    if (idx != legs.length - 1)
                      Container(width: 1, height: 26, color: Colors.grey[300]),
                  ],
                ),
                const SizedBox(width: 12),

                // 2. AIRLINE IMAGE (DYNAMIC)
                Container(
                  height: 32,
                  width: 32,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Image.network(
                    'https://pics.avs.io/100/100/$airlineCode.png',
                    fit: BoxFit.contain,
                    // Placeholder while loading
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Icon(
                        Icons.flight,
                        size: 16,
                        color: Colors.grey,
                      );
                    },
                    // Error icon if image fails to load
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.flight, size: 16, color: Colors.grey),
                  ),
                ),
                const SizedBox(width: 12),

                // 3. ROUTE INFO
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${r.cityFrom} → ${r.cityTo}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        "$airlineCode ${r.flightNo}",
                        style: TextStyle(color: Colors.grey[600], fontSize: 11),
                      ),
                    ],
                  ),
                ),

                // 4. TIME
                Text(
                  "${_formatTime(r.localDeparture)} - ${_formatTime(r.localArrival)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 48),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => context.read<HomeViewModel>().searchFlights(),
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeCity(
    String time,
    String city,
    CrossAxisAlignment alignment,
  ) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          time,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(city, style: const TextStyle(color: Colors.grey, fontSize: 13)),
      ],
    );
  }

  Widget _buildFlightDivider(int stops) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 1,
              color: Colors.grey.withValues(alpha: 0.3),
              margin: const EdgeInsets.symmetric(horizontal: 20),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Color(0xFFE94D2B),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.flight_takeoff,
                color: Colors.white,
                size: 14,
              ),
            ),
          ],
        ),
        Text(
          stops == 0 ? "Non-stop" : "$stops Stop${stops > 1 ? 's' : ''}",
          style: TextStyle(
            color: stops == 0 ? Colors.green : Colors.deepOrange,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
