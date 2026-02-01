// import 'package:flutter/material.dart';
//
//
// class FlightDetailsPage extends StatelessWidget {
//   const FlightDetailsPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Flight Details"),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           children: [
//             CustomCardWidget(
//               margin: const EdgeInsets.only(bottom: 8),
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: Icon(
//                       Icons.flight,
//                       size: 28,
//                       color: AppColors.primaryColor,
//                     ),
//                   ),
//
//                   const SizedBox(height: 12),
//                   const Divider(),
//
//                   const SizedBox(height: 18),
//
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: const [
//                           Text(
//                             "take off time",
//                             style: TextStyle(fontWeight: FontWeight.w600),
//                           ),
//                           SizedBox(height: 4),
//                           Text("delhi",
//                               style: TextStyle(color: Colors.grey)),
//                           SizedBox(height: 4),
//                           Text("Airport",
//                               style: TextStyle(color: Colors.grey)),
//                         ],
//                       ),
//
//                       Expanded(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: const [
//                             Text(".", style: TextStyle(fontSize: 40)),
//                             SizedBox(width: 4),
//                             Text("___", style: TextStyle(fontSize: 32)),
//                           ],
//                         ),
//                       ),
//
//                       CircleAvatar(
//                         radius: 18,
//                         backgroundColor: AppColors.primaryColor,
//                         child: const Icon(
//                           Icons.flight_takeoff_rounded,
//                           color: Colors.white,
//                           size: 18,
//                         ),
//                       ),
//
//                       Expanded(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: const [
//                             Text("___", style: TextStyle(fontSize: 32)),
//                             SizedBox(width: 4),
//                             Text(".", style: TextStyle(fontSize: 40)),
//                           ],
//                         ),
//                       ),
//
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: const [
//                           Text(
//                             "destination time",
//                             style: TextStyle(fontWeight: FontWeight.w600),
//                           ),
//                           SizedBox(height: 4),
//                           Text("delhi",
//                               style: TextStyle(color: Colors.grey)),
//                           SizedBox(height: 4),
//                           Text("Airport",
//                               style: TextStyle(color: Colors.grey)),
//                         ],
//                       ),
//                     ],
//                   ),
//
//                   const SizedBox(height: 12),
//                   const Divider(),
//
//                   Row(
//                     children: const [
//                       Icon(Icons.calendar_month, size: 20),
//                       SizedBox(width: 8),
//                       Text(
//                         "date",
//                         style: TextStyle(fontWeight: FontWeight.w500),
//                       ),
//                       Spacer(),
//                       Text(
//                         "time",
//                         style: TextStyle(fontWeight: FontWeight.w500),
//                       ),
//                     ],
//                   ),
//
//                   const SizedBox(height: 12),
//                   const Divider(),
//
//                   const SizedBox(height: 8),
//
//                   Center(
//                     child: Text(
//                       "price",
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             /// BUTTONS (OUTSIDE CARD)
//             Row(
//               children: [
//                 Expanded(
//                   child: OutlinedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Text("Cancel"),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.primaryColor,
//                       foregroundColor: Colors.white,
//                     ),
//                     onPressed: () {},
//                     child: const Text("Confirm"),
//                   ),
//                 ),
//               ],
//             ),
//
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }
