// ignore_for_file: deprecated_member_use

import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/presentation/resources/index_manager.dart';
import 'package:stream_up_live/presentation/resources/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FollowingViewPage extends StatefulWidget {
  const FollowingViewPage({Key? key}) : super(key: key);

  @override
  State<FollowingViewPage> createState() => _FollowingViewPageState();
}

class _FollowingViewPageState extends State<FollowingViewPage> {
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
          AppStrings.following,
          style: getsemiboldStyle(
              color: ColorManager.white, fontSize: AppSize.s16.mv),
        ),
      ),
      body: SingleChildScrollView(child: Followings()),
    );
  }

  Widget Followings() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 15.0,
        children: List.generate(
            15,
            (index) => users(Lists.Follow[index], Lists.FollowProfile[index],
                Lists.followname[index])),
      ),
    );
  }

  Widget users(backimage, profileimage, username) {
    double cw = AppSize.sizeWidth(context) / 3.3;
    return Container(
      width: cw,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 210,
              decoration: BoxDecoration(
                  color: ColorManager.primarydarkdarkColor,
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(backimage),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(15.0),
                        topRight: const Radius.circular(15.0),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        username,
                        style: getsemiboldStyle(
                            color: ColorManager.white, fontSize: 10.mv),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          "New York, USA",
                          style: getsemiboldStyle(
                              color: ColorManager.primarydarkColor,
                              fontSize: 9.mv),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                      //SizedBox(height: 10.0),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.hs, vertical: 10.0),
                        child: Container(
                          // width: cw / 2.5,
                          decoration: BoxDecoration(
                              color: ColorManager.secondarydarkColor,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Center(
                              child: Text(
                                "Following",
                                style: getmediumStyle(
                                    color: ColorManager.white, fontSize: 8.mv),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 60,
              width: 60,
              margin: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                color: ColorManager.white,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorManager.red, width: 2.0),
                    image: DecorationImage(
                        image: AssetImage(profileimage), fit: BoxFit.cover),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
