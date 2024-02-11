
// import 'package:banolive/utils/index_utils.dart';
// import 'package:flutter/material.dart';

// typedef StatusCallback = void Function(FlushbarStatus?);

// class CustomSnacksBar {
//   CustomSnacksBar._();

//   static void showSnackBar(BuildContext context, String message,
//       {Widget? icon,
//       int? duration,
//       Key? key,
//       Widget? mainButton,
//       StatusCallback? onStatusChange}) {
//     Flushbar(
//       icon: icon ??
//           Icon(
//             Icons.error_outline_rounded,
//             color: Colors.white,
//           ),
//       onStatusChanged: onStatusChange ?? (status) {},
//       mainButton: mainButton,
//       margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
//       borderRadius: BorderRadius.circular(8.0),
//       messageText: Text(
//         message,
//         style: TextStyle(color: Colors.white),
//       ),
//       backgroundGradient: LinearGradient(
//         colors: <Color>[
//           AppColors.btnBlueColor,
//           AppColors.btnBlueColor,
//         ],
//       ),
//       duration: Duration(seconds: duration ?? 2),
//     ).show(context);
//   }
// }
