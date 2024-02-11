// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/presentation/resources/index_manager.dart';

import '../../widgets/index_widget.dart';

class MyInvitesViewPage extends StatefulWidget {
  const MyInvitesViewPage({Key? key}) : super(key: key);

  @override
  State<MyInvitesViewPage> createState() => _MyInvitesViewPageState();
}

class _MyInvitesViewPageState extends State<MyInvitesViewPage> {
  int currentTab = 0;
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
          "My Invites",
          style: getsemiboldStyle(
              color: ColorManager.white, fontSize: AppSize.s16.mv),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        toggleButton(tex1: "Invite a Friend", text2: "My Invites"),
        SizedBox(height: 2.vh),
        Text(
          "My Collectioned Bouns: 10 Beans ",
          style: getmediumStyle(
            color: ColorManager.white,
          ),
        ),
        SizedBox(height: 15.vh),
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(ImageAssets.vipInviteImage),
            ),
          ),
        ),
        SizedBox(height: 15.vh),
        button(
            text: "INVITE",
            color: ColorManager.primary,
            onTap: () {
              // Navigator.pushNamed(context, Routes.homeViewRoute);
            }),
      ])),
    );
  }

  Widget button({Function()? onTap, String? text, Color? color}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context) * 0.06, vertical: 10.0),
      child: CustomButton(
          color: color!,
          text: text ?? "",
          style: getboldStyle(
            color: ColorManager.white,
          ),
          onTap: onTap),
    );
  }

  Widget toggleButton({String? tex1, String? text2}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Expanded(
              child: GestureDetector(
            onTap: (() {
              setState(() {
                currentTab = 0;
              });
            }),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: currentTab == 0
                      ? ColorManager.primary
                      : ColorManager.primarydarkColor),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  tex1!.toUpperCase(),
                  style: getmediumStyle(color: ColorManager.white),
                ),
              )),
            ),
          )),
          const SizedBox(width: 10.0),
          Expanded(
              child: GestureDetector(
            onTap: (() {
              setState(() {
                currentTab = 1;
              });
            }),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: currentTab == 1
                      ? ColorManager.primary
                      : ColorManager.primarydarkColor),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text2!.toUpperCase(),
                  style: getmediumStyle(color: ColorManager.white),
                ),
              )),
            ),
          )),
        ],
      ),
    );
  }
}
