// import 'package:flutter/material.dart';
//
// class GetEmployeeTime extends StatefulWidget {
//   const GetEmployeeTime({super.key});
//
//   @override
//   State<GetEmployeeTime> createState() => _GetEmployeeTimeState();
// }
//
// class _GetEmployeeTimeState extends State<GetEmployeeTime> {
//   double screenHeight = 0;
//   double screenWidth = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     screenHeight = MediaQuery.of(context).size.height;
//     screenWidth = MediaQuery.of(context).size.width;
//     return Container(
//       margin: const EdgeInsets.only(top: 15, bottom: 30),
//       height: screenHeight / 5,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: const [
//             BoxShadow(
//               color: Colors.black26,
//               blurRadius: 10,
//               offset: Offset(2, 2),
//             )
//           ]),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   "CheckIn",
//                   style: TextStyle(
//                     fontSize: screenWidth / 18,
//                     color: Colors.black54,
//                   ),
//                 ),
//                 Text(
//                   checkIn,
//                   style: TextStyle(
//                     fontSize: screenWidth / 15,
//                     color: Colors.black87,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   "CheckOut",
//                   style: TextStyle(
//                     fontSize: screenWidth / 18,
//                     color: Colors.black54,
//                   ),
//                 ),
//                 Text(
//                   checkOut,
//                   style: TextStyle(
//                     fontSize: screenWidth / 15,
//                     color: Colors.black87,
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
