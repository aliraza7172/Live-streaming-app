// import 'package:flutter/material.dart';
// import 'package:zego_zimkit/zego_zimkit.dart';

// import 'package:stream_up_live/presentation/resources/routes_manager.dart';

// // import 'live_streaming.dart';
// // import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';

// class LiveStreamingLoginPage extends StatefulWidget {
//   const LiveStreamingLoginPage({super.key});

//   @override
//   State<LiveStreamingLoginPage> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<LiveStreamingLoginPage> {
//   TextEditingController userName = TextEditingController();
//   TextEditingController userId = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     userName = TextEditingController();
//     userId = TextEditingController();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     // userId.dispose();
//     // userName.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Zego Cloud Zim Login Page  .'),
//           centerTitle: true,
//         ),
//         body: ListView(
//           children: [
//             // => userName TextFormField
//             TextFormField(
//               controller: userName,
//               decoration: const InputDecoration(hintText: "User Name"),
//             ),
//             const SizedBox(
//               height: 50,
//             ),
//             // => userId TextFormField
//             TextFormField(
//               controller: userId,
//               decoration: const InputDecoration(hintText: "User Id"),
//             ),
//             const SizedBox(
//               height: 50,
//             ),
//             // Button Sections .
//             ElevatedButton(
//                 onPressed: () async {
//                   print("object");
//                   await ZIMKit()
//                       .connectUser(id: userId.text, name: userName.text);
//                   // if (mounted) {
//                   Navigator.pushNamed(
//                     context,
//                     Routes.LiveStreamingBasePage,
//                   );
//                   //     .then((value) {
//                   //   debugPrint("Successfully");
//                   // }).onError((error, stackTrace) {
//                   //   debugPrint("$error");
//                   // });
//                   // }
//                   //     .then((value) {
//                   //   Navigator.pushReplacement(
//                   //       context,
//                   //       MaterialPageRoute(
//                   //         builder: (context) => const ZimChatList(),
//                   //       ));
//                   // }).onError((error, stackTrace) {
//                   //   debugPrint("Zim Zego Cloud Error");
//                   // });
//                 },
//                 child: const Text("LogIn Zego Zim"))
//           ],
//         ));
//   }
// }
