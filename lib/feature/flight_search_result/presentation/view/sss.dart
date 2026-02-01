// import 'package:flutter/material.dart';
//
// class FlightSearchResultPage extends StatelessWidget {
//   const FlightSearchResultPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Search Result"),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(12),
//         itemCount: 3,
//         itemBuilder: (context, index) {
//           return CustomCardWidget(
//             margin: const EdgeInsets.only(bottom: 12),
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 /// TOP ROW — Airline, Route, Price
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const Icon(Icons.flight, size: 20),
//                     const SizedBox(width: 8),
//
//                     /// Airline (left, expandable)
//                     Expanded(
//                       child: Text(
//                         'flight.airlssine',
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(fontWeight: FontWeight.w600),
//                       ),
//                     ),
//
//                     const SizedBox(width: 12),
//
//                     /// Route (middle, flexible)
//                     Flexible(
//                       fit: FlexFit.loose,
//                       child: Text(
//                         '{flight.from} → {flight.to}',
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(fontWeight: FontWeight.w500),
//                       ),
//                     ),
//
//                     const SizedBox(width: 12),
//
//                     /// Price (right, fixed)
//                     const Text(
//                       '₹ {flight.price}',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 /// MIDDLE — TIMELINE
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     /// Departure
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           "take off time",
//                           style: TextStyle(fontWeight: FontWeight.w600),
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           "delhi",
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                       ],
//                     ),
//
//                     /// Center timeline (balanced)
//                     Expanded(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           Text(".", style: TextStyle(fontSize: 40)),
//                           SizedBox(width: 4),
//                           Text("___", style: TextStyle(fontSize: 32)),
//                         ],
//                       ),
//                     ),
//
//                     CircleAvatar(
//                       radius: 18,
//                       backgroundColor: AppColors.primaryColor,
//                       child: const Icon(
//                         Icons.flight_takeoff_rounded,
//                         color: Colors.white,
//                         size: 18,
//                       ),
//                     ),
//
//                     Expanded(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: const [
//                           Text("___", style: TextStyle(fontSize: 32)),
//                           SizedBox(width: 4),
//                           Text(".", style: TextStyle(fontSize: 40)),
//                         ],
//                       ),
//                     ),
//
//                     /// Arrival
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: const [
//                         Text(
//                           "destination time",
//                           style: TextStyle(fontWeight: FontWeight.w600),
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           "delhi",
//                           style: TextStyle(color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//
//                 const SizedBox(height: 12),
//                 const Divider(),
//
//                 /// BOTTOM INFO — CLASS & RATE
//                 Row(
//                   children: const [
//                     Icon(Icons.event_seat, size: 20),
//                     SizedBox(width: 8),
//                     Text(
//                       "class",
//                       style: TextStyle(fontWeight: FontWeight.w500),
//                     ),
//                     Spacer(),
//                     Text(
//                       "rate",
//                       style: TextStyle(fontWeight: FontWeight.w500),
//                     ),
//                   ],
//                 ),
//
//                 const SizedBox(height: 16),
//
//                 /// BUTTON
//                 CustomElevatedButton(
//                   backgroundColor: AppColors.primaryColor,
//                   foregroundColor: Colors.white,
//                   text: "Select",
//                   onPressed: () {},
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
//
// class FlightSearchResultPage extends StatelessWidget {
//   const FlightSearchResultPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F5F5),
//       appBar: AppBar(
//         title: const Text(
//           "Search Result",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: const Icon(
//           Icons.arrow_back_ios,
//           color: Colors.black,
//           size: 20,
//         ),
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: 2,
//         itemBuilder: (context, index) {
//           return Container(
//             margin: const EdgeInsets.only(bottom: 16),
//             padding: const EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               children: [
//                 // TOP ROW: Logo, ID, Duration
//                 Row(
//                   children: [
//                     const Text(
//                       "!ndigo",
//                       style: TextStyle(
//                         color: Colors.indigo,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     const Text(
//                       "IN 230",
//                       style: TextStyle(fontWeight: FontWeight.w500),
//                     ),
//                     const Spacer(),
//                     const Text(
//                       "01 hr 40min",
//                       style: TextStyle(color: Colors.grey, fontSize: 12),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 // MIDDLE: Flight Path
//                 Row(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           "5.50",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           "DEL (Delhi)",
//                           style: TextStyle(color: Colors.grey, fontSize: 12),
//                         ),
//                       ],
//                     ),
//                     Expanded(
//                       child: Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 10),
//                             child: Row(
//                               children: [
//                                 Container(
//                                   width: 5,
//                                   height: 5,
//                                   decoration: const BoxDecoration(
//                                     color: Colors.grey,
//                                     shape: BoxShape.circle,
//                                   ),
//                                 ),
//                                 Expanded(
//                                   child: Container(
//                                     height: 1,
//                                     color: Colors.grey.withOpacity(0.3),
//                                   ),
//                                 ),
//                                 Container(
//                                   width: 5,
//                                   height: 5,
//                                   decoration: const BoxDecoration(
//                                     color: Colors.grey,
//                                     shape: BoxShape.circle,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Container(
//                             padding: const EdgeInsets.all(8),
//                             decoration: const BoxDecoration(
//                               color: Color(0xFFE94D2B),
//                               shape: BoxShape.circle,
//                             ),
//                             child: const Icon(
//                               Icons.flight_takeoff,
//                               color: Colors.white,
//                               size: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: const [
//                         Text(
//                           "7.30",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           "CCU (Kolkata)",
//                           style: TextStyle(color: Colors.grey, fontSize: 12),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 // SEAT CLASS & PRICE
//                 Row(
//                   children: const [
//                     Icon(
//                       Icons.airline_seat_recline_normal,
//                       color: Colors.grey,
//                       size: 20,
//                     ),
//                     SizedBox(width: 8),
//                     Text(
//                       "Business Class",
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                     Spacer(),
//                     Text("From  ", style: TextStyle(color: Colors.grey)),
//                     Text(
//                       "\$230",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 // BUTTON
//                 SizedBox(
//                   width: double.infinity,
//                   height: 50,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFFE94D2B),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     onPressed: () {},
//                     child: const Text(
//                       "Check",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
