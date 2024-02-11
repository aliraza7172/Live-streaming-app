// ignore_for_file: deprecated_member_use

import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/custom_divider.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  List<String> iconpath = [
    ImageAssets.facebookIcon,
    ImageAssets.twitterIcon,
    ImageAssets.googleIcon,
    ImageAssets.vkIcon,
    ImageAssets.appleIcon,
  ];
  List<String> title = [
    "Facebook",
    "Twitter",
    "Google",
    "VK",
    "Apple",
  ];
  List choicsRoute = [
    Routes.BlockedListScreenViewRoute,
    Routes.PrivacyViewRoute,
    Routes.BlockedListScreenViewRoute,
    Routes.PrivacyViewRoute,
    Routes.BlockedListScreenViewRoute,
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
          "Security",
          style: getsemiboldStyle(
              color: ColorManager.white, fontSize: AppSize.s16.mv),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: customeText(
                title: "Bind Account",
                color: ColorManager.white,
                fontSize: 16.mv),
          ),
          customeListTile(
            IconPath: ImageAssets.phoneIcon,
            title: "Phone",
            color: ColorManager.red,
            onTap: () {
              // Navigator.pushNamed(context, choicsRoute[index]);
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: customeText(
                title:
                    "You have bound your mobile phone number, and the account security factor is better",
                color: ColorManager.grey3,
                fontSize: 12.mv),
          ),
          Customdivider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: title.length,
              separatorBuilder: (context, index) => Divider(
                color: ColorManager.grey,
              ),
              itemBuilder: (context, index) => customeListTile(
                IconPath: iconpath[index],
                title: title[index],
                onTap: () {
                  // Navigator.pushNamed(context, choicsRoute[index]);
                },
              ),
            ),
          ),
          Customdivider(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: customeText(
                title: "Safety Tips",
                color: ColorManager.white,
                fontSize: 16.mv),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: customeText(
                title:
                    "1. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                color: ColorManager.grey3,
                fontSize: 12.mv),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: customeText(
                title:
                    "2. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                color: ColorManager.grey3,
                fontSize: 12.mv),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: customeText(
                title: "Account Ownership",
                color: ColorManager.white,
                fontSize: 16.mv),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: customeText(
                title:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                color: ColorManager.grey3,
                fontSize: 12.mv),
          ),
        ]),
      ),
    );
  }

  Widget customeListTile({
    String? title,
    void Function()? onTap,
    String? IconPath,
    Color? color,
  }) {
    // double cw = AppSize.sizeWidth(context) / 3.3;
    return ListTile(
      // contentPadding: EdgeInsets.only(left: 1.0),
      leading: SvgPicture.asset(
        IconPath!,
        color: color ?? ColorManager.white,
      ),
      title: Transform.translate(
        offset: Offset(-20, 0),
        child: Text(title ?? "",
            style: getRegularStyle(
                color: ColorManager.whiteColor, fontSize: 16.mv)),
      ),
      trailing: Wrap(
        spacing: 12, // space between two icons
        children: <Widget>[
          title == "Phone"
              ? Text(
                  "+1234567890",
                  style: getRegularStyle(
                      color: ColorManager.grey3, fontSize: 13.mv),
                )
              : SizedBox(),
          SvgPicture.asset(
            ImageAssets.forwardIcon,
            color: ColorManager.white,
          ), // icon-1
        ],
      ),
      // SvgPicture.asset(ImageAssets.forwardIcon),
      onTap: onTap,
    );
  }

  Widget customeText({String? title, Color? color, double? fontSize}) {
    return Text(title!,
        style: getRegularStyle(color: color!, fontSize: fontSize!));
  }
}
