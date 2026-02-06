import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/widget/custom_text_field_widget.dart';
import '../viewmodel/airport_search_view_model.dart';
import '../widgets/shimmer_loading_widget.dart';

class AirportSearchPage extends StatelessWidget {
  const AirportSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (AirportSearchViewModel vm) => vm.isLoading,
    );
    final locations = context.select(
      (AirportSearchViewModel vm) => vm.locations,
    );
    return Scaffold(
      backgroundColor: Color(0xfffafbfa),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 32),
              CustomTextFieldWidget(
                hintText: 'Search airports (e.g. Delhi)',
                onChanged: (val) =>
                    context.read<AirportSearchViewModel>().onSearchChanged(val),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: isLoading
                    ? ShimmerLoadingWidget()
                    : ListView.builder(
                        itemCount: locations.length,
                        itemBuilder: (context, index) {
                          final airport = locations[index];
                          return ListTile(
                            leading: const Icon(Icons.flight_takeoff),
                            title: Text(airport.name ?? 'Unknown Airport'),
                            subtitle: Text(
                              '${airport.city?.name ?? 'Unknown City'} • ${airport.code ?? 'N/A'}',
                            ),
                            onTap: () {
                              Navigator.pop(context, airport);
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
