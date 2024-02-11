// ignore_for_file: deprecated_member_use

import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/custom_divider.dart';
import '../resources/index_manager.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool b1 = true;
  bool b2 = false;
  bool b3 = false;
  bool b4 = true;
  bool b5 = false;
  bool b6 = false;
  bool b7 = false;
  bool b8 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.secondarydarkColor,
        appBar: AppBar(
          backgroundColor: ColorManager.primarydarkdarkColor,
          centerTitle: false,
          titleSpacing: 0,
          elevation: 1.0,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SvgPicture.asset(
                ImageAssets.arrowbackIcon,
                color: ColorManager.white,
              ),
            ),
          ),
          title: Text(
            "Privacy",
            style: getsemiboldStyle(
                color: ColorManager.white, fontSize: AppSize.s16.mv),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              box(
                  main: "Hide Location",
                  btn: b1,
                  onchange: (bool value) {
                    setState(() {
                      b1 = value;
                    });
                  }),
              Customdivider(),
              box(
                  main: "Hide Your Online Status",
                  btn: b2,
                  onchange: (bool value) {
                    setState(() {
                      b2 = value;
                    });
                  }),
              Customdivider(),
              box(
                  main: "Hide Your Recent Active Time",
                  btn: b3,
                  onchange: (bool value) {
                    setState(() {
                      b3 = value;
                    });
                  }),
              Customdivider(thikness: 11),
              box(
                  main: "Comment Post",
                  btn: b4,
                  onchange: (bool value) {
                    setState(() {
                      b4 = value;
                    });
                  }),
              Customdivider(),
              box(
                  main: "Do Not Distrub From Strangers",
                  btn: b5,
                  onchange: (bool value) {
                    setState(() {
                      b5 = value;
                    });
                  }),
              Customdivider(),
              box(
                  main: "Do Not Accept Strangers Line Invitations",
                  btn: b6,
                  onchange: (bool value) {
                    setState(() {
                      b6 = value;
                    });
                  }),
              Customdivider(),
              box(
                  main:
                      "Hide Your Following Information In Your Profile-Post Tab",
                  btn: b7,
                  onchange: (bool value) {
                    setState(() {
                      b7 = value;
                    });
                  }),
              Customdivider(thikness: 11),
              box(
                  main: "Close Screenshots In Profile",
                  btn: b8,
                  onchange: (bool value) {
                    setState(() {
                      b8 = value;
                    });
                  }),
            ],
          ),
        ));
  }

  // Widget Customdivider({double? thikness}) {
  //   return Customdivider(
  //     thickness: thikness??0.0,
  //     color: ColorManager.primarydarkdarkColor,
  //   );
  // }

  Widget box({String? main, bool? btn, void Function(bool)? onchange}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSize.s8,
                ),
                Text(main!,
                    style: getRegularStyle(
                        color: ColorManager.whiteColor, fontSize: 16.mv)),
                SizedBox(
                  height: AppSize.s8,
                ),
                Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                    style: getRegularStyle(
                        color: ColorManager.grey3, fontSize: 12.mv))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CupertinoSwitch(
              activeColor: ColorManager.red,
              // trackColor: ColorManager.red,
              thumbColor: ColorManager.secondarydarkColor,
              value: btn!,
              onChanged: onchange,
              // (bool value) {
              //   setState(() {
              //     btn = value;
              //   }
              // );
              // }
            ),
          ),
        ],
      ),
    );
  }
}
