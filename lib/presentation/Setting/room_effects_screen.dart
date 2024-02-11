// ignore_for_file: deprecated_member_use

import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/custom_divider.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class RoomEffectsScreen extends StatefulWidget {
  const RoomEffectsScreen({super.key});

  @override
  State<RoomEffectsScreen> createState() => _RoomEffectsScreenState();
}

class _RoomEffectsScreenState extends State<RoomEffectsScreen> {
  bool b1 = true;
  bool b2 = false;
  bool b3 = false;
  bool b4 = true;

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
            "Room Effects",
            style: getsemiboldStyle(
                color: ColorManager.white, fontSize: AppSize.s16.mv),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              box(
                  main: "Gift Effects (Animation + Sound)",
                  btn: b1,
                  onchange: (bool value) {
                    setState(() {
                      b1 = value;
                    });
                  }),
              Customdivider(),
              box(
                  main: "Gift Sound Effects ",
                  btn: b2,
                  onchange: (bool value) {
                    setState(() {
                      b2 = value;
                    });
                  }),
              Customdivider(thikness: 11),
              box(
                  main: "Entrance Effects (Animation + Sound)",
                  btn: b3,
                  onchange: (bool value) {
                    setState(() {
                      b3 = value;
                    });
                  }),
              Customdivider(),
              box(
                  main: "Entrance Sound Effects ",
                  btn: b4,
                  onchange: (bool value) {
                    setState(() {
                      b4 = value;
                    });
                  }),
              Customdivider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt",
                    style: getRegularStyle(
                        color: ColorManager.grey3, fontSize: 12.mv)),
              )
            ],
          ),
        ));
  }

  // Widget divider({double? thikness}) {
  //   return Divider(
  //     thickness: thikness??0.0,
  //     color: ColorManager.primarydarkdarkColor,
  //   );
  // }

  Widget box({String? main, bool? btn, void Function(bool)? onchange}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(main!,
                style: getRegularStyle(
                    color: ColorManager.whiteColor, fontSize: 16.mv)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CupertinoSwitch(
              activeColor: ColorManager.red,
              thumbColor: ColorManager.secondarydarkColor,
              value: btn!,
              onChanged: onchange,
            ),
          ),
        ],
      ),
    );
  }
}
