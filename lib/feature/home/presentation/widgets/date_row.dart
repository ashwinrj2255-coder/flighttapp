import 'package:flutter/material.dart';
import 'package:flymate/core/constants/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../../core/widget/custom_text_field_widget.dart';
import '../view_model/home_view_model.dart';

class DateRow extends StatelessWidget {
  final TextEditingController departureController;
  final TextEditingController returnController;

  const DateRow({
    super.key,
    required this.departureController,
    required this.returnController,
  });

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    return Row(
      children: [
        // ✅ Departure (always enabled)
        Expanded(
          child: CustomTextFieldWidget(
            readOnly: true,
            hintText: 'Departure',
            prefixIcon: const Icon(Icons.calendar_month_sharp),
            controller: departureController,
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: ColorScheme.light(
                        primary: AppColors.primaryColor, // selected date + header
                        onPrimary: Colors.white,          // text on selected date
                        onSurface: Colors.black,          // normal date text
                        outline: AppColors.primaryColor,  // borders
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.primaryColor, // OK / CANCEL
                        ),
                      ),
                    ),
                    child: child!,
                  );
                },
              );

              if (picked != null) {
                vm.setDepartureDate(picked);
                departureController.text =
                "${picked.day}/${picked.month}/${picked.year}";
              }
            },
          ),
        ),

        const SizedBox(width: 12),

         Expanded(
          child: Opacity(
            opacity: vm.isRoundTrip ? 1 : 0.4,
            child: CustomTextFieldWidget(
              readOnly: true,
              hintText: '+Add return date',
              controller: returnController,
              onTap: vm.isRoundTrip
                  ? () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: vm.departureDate ?? DateTime.now(),
                        firstDate: vm.departureDate ?? DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      );

                      if (picked != null) {
                        vm.setReturn(picked);
                        returnController.text =
                            "${picked.day}/${picked.month}/${picked.year}";
                      }
                    }
                  : null, // 🔑 disables tap
            ),
          ),
        ),
      ],
    );
  }
}
