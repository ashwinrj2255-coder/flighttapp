import 'package:flutter/material.dart';
import 'package:flymate/feature/home/presentation/widgets/traveller_row.dart';
import 'package:provider/provider.dart';

import '../../../../core/widget/custom_elevated_button_widget.dart';
import '../view_model/home_view_model.dart';

class TravellerBottomSheet extends StatelessWidget {
  const TravellerBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (_, vm, __) {

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TravellerRow(
                title: 'Adults',
                subtitle: '12+ years',
                count: vm.adults,
                onAdd: vm.incrementAdults,
                onRemove: vm.decrementAdults,
              ),
              TravellerRow(
                title: 'Children',
                subtitle: '2–11 years',
                count: vm.children,
                onAdd: vm.incrementChildren,
                onRemove: vm.decrementChildren,
              ),
              TravellerRow(
                title: 'Infants',
                subtitle: 'Under 2',
                count: vm.infants,
                onAdd: vm.incrementInfants,
                onRemove: vm.decrementInfants,
              ),
              const SizedBox(height: 16),
              CustomElevatedButton(
                text: 'Done',
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
