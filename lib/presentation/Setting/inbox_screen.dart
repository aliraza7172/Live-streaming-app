// ignore_for_file: deprecated_member_use

import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

bool alluser = false;
bool useronfollpwedlist = false;
bool higherleveluser = true;

class _InboxScreenState extends State<InboxScreen> {
  List<String> title = [
    "User Level",
    "Talent Level",
  ];
  List choicsRoute = [
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
          "Inbox",
          style: getsemiboldStyle(
              color: ColorManager.white, fontSize: AppSize.s16.mv),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        customeText("Accept Private Message From"),
        Customdivider(),
        selectionArea(
          title: "All Users",
          onTap: (() {
            setState(() {
              alluser = true;
              useronfollpwedlist = false;
              higherleveluser = false;
            });
          }),
          trailing:
              alluser == true ? SvgPicture.asset(ImageAssets.checkIcon) : null,
        ),
        Customdivider(),
        selectionArea(
          title: "Users On Followed List",
          onTap: (() {
            setState(() {
              useronfollpwedlist = true;
              alluser = false;
              higherleveluser = false;
            });
          }),
          trailing: useronfollpwedlist == true
              ? SvgPicture.asset(ImageAssets.checkIcon)
              : null,
        ),
        Customdivider(),
        selectionArea(
          title: "Higher Level Users",
          onTap: (() {
            setState(() {
              higherleveluser = true;
              alluser = false;
              useronfollpwedlist = false;
            });
          }),
          trailing: higherleveluser == true
              ? SvgPicture.asset(ImageAssets.checkIcon)
              : null,
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
              title: title[index],
              onTap: () {
                // Navigator.pushNamed(context, choicsRoute[index]);
              },
            ),
          ),
        ),
        Customdivider(),
        customeText("User can still receive private message from firiends"),
      ]),
    );
  }

  Widget selectionArea(
      {String? title, void Function()? onTap, Widget? trailing}) {
    return ListTile(
      // leading: SvgPicture.asset(IconPath!),
      title: Text(title ?? "",
          style:
              getRegularStyle(color: ColorManager.whiteColor, fontSize: 16.mv)),
      trailing: trailing,
      onTap: onTap,
    );
  }

  Widget customeListTile({String? title, void Function()? onTap}) {
    double cw = AppSize.sizeWidth(context) / 3.3;
    return ListTile(
      // leading: SvgPicture.asset(IconPath!),
      title: Text(title ?? "",
          style:
              getRegularStyle(color: ColorManager.whiteColor, fontSize: 16.mv)),
      trailing: Wrap(
        spacing: 12, // space between two icons
        children: <Widget>[
          title == "User Level"
              ? Container(
                  width: cw / 2.5,
                  decoration: BoxDecoration(
                      color: ColorManager.red,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Center(
                      child: Text(
                        "Lv. 4",
                        style: getsemiboldStyle(
                            color: ColorManager.white, fontSize: 8.mv),
                      ),
                    ),
                  ),
                )
              : Container(
                  width: cw / 2.5,
                  decoration: BoxDecoration(
                      color: ColorManager.yellow,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          ImageAssets.diamindIcon,
                          height: 12,
                          width: 12,
                        ),
                        SizedBox(width: 3.0),
                        Text(
                          "06",
                          style: getsemiboldStyle(
                              color: ColorManager.white, fontSize: 8.mv),
                        ),
                      ],
                    ),
                  ),
                ),
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

  Widget customeText(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Text(title,
          style: getRegularStyle(color: ColorManager.grey3, fontSize: 12.mv)),
    );
  }
}
