import 'package:flutter/material.dart';
import 'package:flymate/core/widget/custom_card_widget.dart';
import 'package:flymate/core/widget/custom_elevated_button_widget.dart';
import 'package:flymate/core/widget/custom_text_field_widget.dart';
import 'package:flymate/feature/home/presentation/view_model/home_view_model.dart';
import 'package:flymate/feature/home/presentation/widgets/flight_menu_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../airport_search/data/model/get_airport_search_response_model.dart';
import '../../../airport_search/presentation/view/airport_search_page.dart';
import '../widgets/date_row.dart';
import '../widgets/traveller_bottom_sheet.dart';
import '../widgets/trip_type_tab_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final departureDateController = TextEditingController();
  final returnDateController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  void _openTravellerSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => const TravellerBottomSheet(),
    );
  }

  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    departureDateController.dispose();
    returnDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select<HomeViewModel, bool>((vm) => vm.isLoading);

    final travelSummary = context.select<HomeViewModel, String>(
      (vm) => vm.travellerSummary,
    );

    final travelClass = context.select<HomeViewModel, String?>(
      (vm) => vm.travelClass,
    );


    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xfffafbfa),
        title: Text("Book Flight"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              _scaffoldKey.currentState?.openEndDrawer();
            },
            icon: Icon(Icons.menu),
          )
        ],
      ),
      endDrawer: const FlightMenuDrawer(),
      backgroundColor: Color(0xfffafbfa),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: 400,
            child: Column(
              children: [
                const TripTypeTabBar(),
                const SizedBox(height: 22),

                GestureDetector(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  behavior: HitTestBehavior.translucent,
                  child: CustomCardWidget(
                    backgroundColor: Color(0xffffffff),
                    padding: const EdgeInsets.all(20),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            CustomTextFieldWidget(
                              prefixIcon: Icon(Icons.flight_takeoff_sharp),
                              hintText: 'From',
                              readOnly: true,
                              controller: fromController,
                              onTap: () async {
                                if (!mounted) return;

                                // 1. Wait for the user to pick an airport
                                final result =
                                    await Navigator.push<LocationElement>(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            const AirportSearchPage(),
                                      ),
                                    );

                                // 2. Check if the user actually picked something (didn't just press back)
                                if (result != null) {
                                  final homeVm = context.read<HomeViewModel>();

                                  // 3. Update the ViewModel
                                  homeVm.setFromAirport(result);

                                  // 4. Update the UI Text (Safe null handling)
                                  fromController.text =
                                      '${result.city?.name ?? ""} (${result.code ?? ""})';
                                }
                              },
                            ),
                            const SizedBox(height: 32),

                            CustomTextFieldWidget(
                              prefixIcon: Icon(Icons.flight_land_sharp),
                              readOnly: true,
                              hintText: 'To',
                              controller: toController,
                              onTap: () async {
                                if (!mounted) return;

                                // 1. Wait for the user to pick an airport
                                final result =
                                    await Navigator.push<LocationElement>(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>
                                            const AirportSearchPage(),
                                      ),
                                    );

                                // 2. Check if the user actually picked something (didn't just press back)
                                if (result != null) {
                                  final homeVm = context.read<HomeViewModel>();

                                  // 3. Update the ViewModel
                                  homeVm.setToAirport(result);

                                  // 4. Update the UI Text (Safe null handling)
                                  toController.text =
                                      '${result.city?.name ?? ""} (${result.code ?? ""})';
                                }
                              },
                            ),
                            const SizedBox(height: 32),

                            DateRow(
                              departureController: departureDateController,
                              returnController: returnDateController,
                            ),
                            const SizedBox(height: 32),

                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextFieldWidget(
                                    readOnly: true,
                                    onTap: _openTravellerSheet,
                                    hintText: 'Traveller',
                                    child: Text(travelSummary),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: CustomTextFieldWidget(
                                    hintText: 'Class',
                                    child: SizedBox(
                                      height: 20,
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          value: travelClass,
                                          onChanged: (v) {
                                            if (v != null) {
                                              context
                                                  .read<HomeViewModel>()
                                                  .setTravelClass(v);
                                            }
                                          },
                                          isExpanded: true,
                                          isDense: true,
                                          itemHeight: 48,
                                          alignment: Alignment.centerLeft,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium,
                                          items: const [
                                            DropdownMenuItem(
                                              value: 'Economy',
                                              child: Text('Economy'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'Premium',
                                              child: Text('Premium'),
                                            ),
                                            DropdownMenuItem(
                                              value: 'Business',
                                              child: Text('Business'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),

                            CustomElevatedButton(
                              text: 'Search',
                              backgroundColor: AppColors.primaryColor,
                              foregroundColor: Colors.white,
                              onPressed: () {
                                context.push('/search-page');
                              },
                            ),
                          ],
                        ),
                        Positioned(
                          right: 30,
                          top: 40,
                          child: Material(
                            color: Colors.white,
                            shape: const CircleBorder(),
                            elevation: 4,
                            child: IconButton.outlined(
                              onPressed: () {
                                final vm = context.read<HomeViewModel>();
                                vm.swap();

                                // Update the text controllers to show the swapped values
                                fromController.text = vm.fromAirport != null
                                    ? '${vm.fromAirport?.city?.name ?? ""} (${vm.fromAirport?.code ?? ""})'
                                    : "";

                                toController.text = vm.toAirport != null
                                    ? '${vm.toAirport?.city?.name ?? ""} (${vm.toAirport?.code ?? ""})'
                                    : "";
                              },

                              icon: Icon(
                                Icons.swap_vert_circle_sharp,
                                size: 46,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
