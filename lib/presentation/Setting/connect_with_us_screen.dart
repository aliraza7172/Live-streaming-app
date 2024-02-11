// ignore_for_file: deprecated_member_use

import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/custome_button.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class ConnectWithUsScreen extends StatefulWidget {
  const ConnectWithUsScreen({super.key});

  @override
  State<ConnectWithUsScreen> createState() => _ConnectWithUsScreenState();
}

class _ConnectWithUsScreenState extends State<ConnectWithUsScreen> {
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
          "Connect With Us",
          style: getsemiboldStyle(
              color: ColorManager.white, fontSize: AppSize.s16.mv),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            customeText(
                title: "We seek Cooperation in the following Categories",
                color: ColorManager.white,
                fontSize: 16.mv),
            SizedBox(height: AppSize.s10.vs),
            customeText(
                title: "1. Celebrity/Influencer/Expert Content Cooperation",
                color: ColorManager.white,
                fontSize: 16.mv),
            SizedBox(height: AppSize.s10.vs),
            customeText(
                title:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                color: ColorManager.grey3,
                fontSize: 12.mv),
            SizedBox(height: AppSize.s17.vs),
            customeText(
                title: "2.  Brand Cooperation",
                color: ColorManager.white,
                fontSize: 16.mv),
            SizedBox(height: AppSize.s10.vs),
            customeText(
                title:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                color: ColorManager.grey3,
                fontSize: 12.mv),
            SizedBox(height: AppSize.s17.vs),
            customeText(
                title: "3.  Agency Onboarding",
                color: ColorManager.white,
                fontSize: 16.mv),
            SizedBox(height: AppSize.s10.vs),
            customeText(
                title:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                color: ColorManager.grey3,
                fontSize: 12.mv),
            SizedBox(height: AppSize.s17.vs),
            customeText(
                title: "Here is what we can help you with",
                color: ColorManager.white,
                fontSize: 16.mv),
            SizedBox(height: AppSize.s10.vs),
            customeText(
                title:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
                color: ColorManager.grey3,
                fontSize: 12.mv),
            SizedBox(height: AppSize.s10.vs),
            CustomButton(
                color: ColorManager.red,
                text: "Connect With Us",
                style: getboldStyle(
                  color: ColorManager.white,
                ),
                onTap: () {}),
          ]),
        ),
      ),
    );
  }

  Widget customeText({String? title, Color? color, double? fontSize}) {
    return Text(title!,
        style: getRegularStyle(color: color!, fontSize: fontSize!));
  }
}
