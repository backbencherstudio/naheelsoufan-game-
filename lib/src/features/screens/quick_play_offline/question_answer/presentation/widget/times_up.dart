// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
//
// import '../../../../../grid_play_game/riverpod/function.dart';
// import '../../../riverpod/advance_turn_controller.dart';
// import 'clock_container.dart';
//
// void timesUp(BuildContext context, ref) {
//   bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
//   final timeUpState = ref.watch(showTimeUp);
//
//   // Show dialog immediately
//   showDialog(
//     context: context,
//     barrierDismissible: false,
//     builder: (BuildContext dialogContext) {
//
//       final huntMode = ref.watch(huntModeOn);
//
//       Future.delayed(Duration(seconds: 5), () {
//         ref.read(showTimeUp.notifier).state = false;
//         if (Navigator.of(context).canPop()) {
//           Navigator.of(context).pop();
//         }
//       });
//       if (timeUpState == false) {
//         ref.read(showTimeUp.notifier).state = true;
//       }
//
//       return Dialog(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: isPortrait ? 16.w : 35.2.h),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ClockWidgets(text: '60', color: Color(0xffDE3730)),
//               SizedBox(height: isPortrait ? 24.h : 10.8.w),
//               Text(
//                 'Times Up!',
//                 style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//                   color: Color(0xffFFDAD6),
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//               SizedBox(height: isPortrait ? 8.h : 3.6.w),
//               Text(
//                 textAlign: TextAlign.center,
//                 'Other players will got the chance to steal the point',
//                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                   color: Color(0xffE0E0FF),
//                   fontWeight: FontWeight.w700,
//                   fontSize: isPortrait ? 13.sp : 5.85.sp,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
//
