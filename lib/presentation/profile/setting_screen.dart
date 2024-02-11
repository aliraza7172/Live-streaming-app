// ignore_for_file: deprecated_member_use

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stream_up_live/presentation/login/login_with_social_media_screen.dart';
import 'package:stream_up_live/widgets/index_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/presentation/resources/index_manager.dart';

class SettingViewPage extends StatefulWidget {
  const SettingViewPage({Key? key}) : super(key: key);

  @override
  State<SettingViewPage> createState() => _SettingViewPageState();
}

class _SettingViewPageState extends State<SettingViewPage> {
  List<String> title = [
    "Privacy",
    "Blocked List",
    "Security",
    "Room Effects",
    "Inbox",
    "Language",
    // "App Alerts",
    // "Clear Chache",
    // "Review Us!",
    // "Facebook",
    "FAQ",
    // "Check For Update",
    "Connect With Us",
    // "About",
  ];
  List choicsRoute = [
    Routes.PrivacyViewRoute,
    Routes.BlockedListScreenViewRoute,
    Routes.SecurityScreenViewRoute,
    Routes.RoomEffectsScreenViewRoute,
    Routes.InboxScreenVieRoute,
    Routes.LanguageScreenViewRoute,
    // Routes.EarningViewPageRoute,
    // Routes.MyBadgeViewRoute,
    // Routes.HelpSupportViewRoute,
    // Routes.EditProfileViewRoute,
    Routes.FAQsScreenViewRoute,
    // Routes.MyInvitesViewRoute,
    Routes.ConnectWithUsScreenViewRoute,
    // Routes.WealthClassViewRoute,
  ];
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
          "Settings",
          style: getsemiboldStyle(
              color: ColorManager.white, fontSize: AppSize.s16.mv),
        ),
      ),
      body: Column(children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ListView.separated(
              itemCount: title.length,
              separatorBuilder: (context, index) => Divider(
                color: ColorManager.grey,
              ),
              itemBuilder: (context, index) => customListTile(
                title: title[index],
                onTap: () {
                  Navigator.pushNamed(context, choicsRoute[index]);
                },
              ),
            ),
          ),
        ),
        button(
            text: "Log Out",
            color: ColorManager.primarydarkdarkColor,
            onTap: () {
              final box = GetStorage();
              box.remove(LocalDBStrings.login_user);
              Get.offAll(()=>LoginWithSocialMediaView());
              // Navigator.pushReplacementNamed(
              //     context, Routes.loginRoute);
            }),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Powered by stream_up_live.",
              style: getsemiboldStyle(
                  color: ColorManager.whiteColor, fontSize: 14.mv)),
        ),
      ]),
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

  Widget customListTile({String? title, void Function()? onTap}) {
    return ListTile(
      // leading: SvgPicture.asset(IconPath!),
      title: Text(title ?? "",
          style: getsemiboldStyle(
              color: ColorManager.whiteColor, fontSize: 14.mv)),
      trailing: SvgPicture.asset(ImageAssets.forwardIcon),
      onTap: onTap,
    );
  }
}
