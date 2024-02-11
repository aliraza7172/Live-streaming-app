// ignore_for_file: deprecated_member_use

import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/list.dart';
import '../resources/routes_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class BlockedListScreen extends StatefulWidget {
  const BlockedListScreen({super.key});

  @override
  State<BlockedListScreen> createState() => _BlockedListScreenState();
}

class _BlockedListScreenState extends State<BlockedListScreen> {
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
          "Blocked List",
          style: getsemiboldStyle(
              color: ColorManager.white, fontSize: AppSize.s16.mv),
        ),
      ),
      body: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, i) => Divider(color: ColorManager.grey),
          itemBuilder: (context, index) {
            double cw = AppSize.sizeWidth(context) / 3.3;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: ColorManager.primary, shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage:
                            AssetImage(Lists.FresherUserList[index]),
                      ),
                    ),
                  ),
                  //column
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 10.0),
                          child: Text(
                            Lists.FreshernameList[index],
                            style: getmediumStyle(
                                fontSize: 14.mv, color: ColorManager.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: cw / 2.5,
                                decoration: BoxDecoration(
                                    color: ColorManager.darkblue,
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Center(
                                    child: Text(
                                      "Lv.09",
                                      style: getsemiboldStyle(
                                          color: ColorManager.white,
                                          fontSize: 8.mv),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5.0),
                              Container(
                                width: cw / 2.5,
                                decoration: BoxDecoration(
                                    color: ColorManager.gradientColor,
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        ImageAssets.crownIcon,
                                        height: 12,
                                        width: 12,
                                      ),
                                      SizedBox(width: 3.0),
                                      Text(
                                        "06",
                                        style: getsemiboldStyle(
                                            color: ColorManager.white,
                                            fontSize: 8.mv),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        // color: ColorManager.red,
                        border: Border.all(color: ColorManager.red),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 5.0),
                              child: Text(
                                "Unblock",
                                style: getboldStyle(
                                  color: ColorManager.red,
                                ),
                              ))),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
