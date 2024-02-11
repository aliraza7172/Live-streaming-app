// import 'package:banolive_theme/widgets/vertical_chat_list.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../resources/index_manager.dart';

// class ChatView extends StatefulWidget {
//   @override
//   _ChatViewState createState() => _ChatViewState();
// }

// class _ChatViewState extends State<ChatView> {
//   @override
//   Widget build(BuildContext context) {
//     return chatList();
//     // SafeArea(
//     //   child: Scaffold(
//     //     appBar: AppBar(
//     //       centerTitle: false,
//     //       titleSpacing: 0,
//     //       elevation: 1.0,
//     //       leading: SizedBox(),
//     //       title: Text(
//     //         AppStrings.chat,
//     //         style: getsemiboldStyle(
//     //             color: ColorManager.blackBorder, fontSize: AppSize.s16.sp),
//     //       ),
//     //       actions: [
//     //         SvgPicture.asset(ImageAssets.usertwoIcon),
//     //         SizedBox(width: 10.0),
//     //         SvgPicture.asset(ImageAssets.settingtwoIcon),
//     //         SizedBox(width: 10.0),
//     //       ],
//     //     ),
//     //     backgroundColor: Colors.white,
//     //     body:

//     //     chatList(),
//     //   ),
//     // );
//   }

//   ListView chatList() {
//     return ListView.builder(
//         itemCount: 11,
//         itemBuilder: (context, index) {
//           return index == 0
//               ? SizedBox(
//                   height: 15,
//                 )
//               : verticalChatList(context, index);
//         });
//   }
// }
