// ignore_for_file: deprecated_member_use

import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/widgets/toggle_button_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../resources/index_manager.dart';

class WealthClassView extends StatefulWidget {
  const WealthClassView({Key? key}) : super(key: key);

  @override
  State<WealthClassView> createState() => _WealthClassViewState();
}

class _WealthClassViewState extends State<WealthClassView> {
  int selectedid = 0;
  List _categories = [
    "Sliver",
    "Brozone",
    "Crystal",
    "Gem",
    "Gold",
    "Crown",
    "King",
  ];

  List carImage = [
    ImageAssets.car1Image,
    ImageAssets.car2Image,
  ];
  double coverheight = 100;
  double profileheight = 100;
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
          "Wealth Class",
          style: getsemiboldStyle(
              color: ColorManager.white, fontSize: AppSize.s16.mv),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            hotwidget(),
            exclusivePriviledge(),
            classPriviledge(),
            watchCertificate(),
          ],
        ),
      ),
    );
  }

  Widget watchCertificate() {
    final top = coverheight - profileheight / 2;
    final bottom = profileheight / 2;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
              child: SvgPicture.asset(
            ImageAssets.crownIcon,
            height: 50,
            width: 50,
          )),
          Padding(
            padding: const EdgeInsets.only(top: 48),
            child: Container(
              height: 20,
              decoration: BoxDecoration(
                  color: ColorManager.orangeColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 55.0),
            child: Container(
              width: AppSize.sizeWidth(context),
              decoration: BoxDecoration(
                  color: ColorManager.primarydarkdarkColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 40.0, horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //profile
                    Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: bottom),
                          height: coverheight,
                          //  color: Colors.grey,
                          child: Image.asset(
                            ImageAssets.newUser2Image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: top,
                          child: Container(
                            decoration: BoxDecoration(
                                color: ColorManager.secondarydarkColor,
                                shape: BoxShape.circle),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: CircleAvatar(
                                radius: profileheight / 2,
                                backgroundColor: Colors.grey.shade800,
                                backgroundImage: AssetImage(
                                  ImageAssets.newUser1Image,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    //profile end

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "James Olivia",
                            style: getboldStyle(color: ColorManager.white),
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            "New York, USA",
                            style: getsemiboldStyle(color: ColorManager.grey),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Container(
                            //  width: cw / 2.5,
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
                                    ImageAssets.beansIcon,
                                    height: 16,
                                    width: 16,
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    "300K Beans",
                                    style: getsemiboldStyle(
                                        color: ColorManager.white,
                                        fontSize: 12.mv),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Flexible(
                          child: Container(
                            //  width: cw / 2.5,
                            decoration: BoxDecoration(
                                color: ColorManager.primarydarkColor,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    ImageAssets.beansIcon,
                                    height: 16,
                                    width: 16,
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    "600K Coins",
                                    style: getsemiboldStyle(
                                        color: ColorManager.white,
                                        fontSize: 12.mv),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      AppStrings.loremipsum3lines,
                      textAlign: TextAlign.center,
                      style: getsemiboldStyle(
                          color: ColorManager.white, fontSize: 12.mv),
                    ),
                    Image.asset(
                      ImageAssets.namespaceImage,
                      height: 100,
                      width: 200,
                      fit: BoxFit.contain,
                    ),
                    followersPosts(),
                    Image.asset(
                      ImageAssets.liveWelathImage,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 54),
            child: Container(
              width: AppSize.sizeWidth(context) / 2,
              height: 30,
              decoration: BoxDecoration(
                  color: ColorManager.orangeColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  )),
              child: Center(
                  child: Text(
                "Class Priviledge",
                style: getsemiboldStyle(
                    color: ColorManager.white, fontSize: 14.mv),
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget classPriviledge() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
              child: SvgPicture.asset(
            ImageAssets.crownIcon,
            height: 50,
            width: 50,
          )),
          Padding(
            padding: const EdgeInsets.only(top: 48),
            child: Container(
              height: 20,
              decoration: BoxDecoration(
                  color: ColorManager.orangeColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 55.0),
            child: Container(
              width: AppSize.sizeWidth(context),
              decoration: BoxDecoration(
                  color: ColorManager.primarydarkdarkColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 40.0, horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          ImageAssets.namespaceImage,
                          height: 100,
                          width: 100,
                        ),
                        Text(
                          "Nameplate",
                          style: getsemiboldStyle(color: ColorManager.white),
                        ),
                      ],
                    ),

                    Column(
                      children: [
                        Image.asset(
                          ImageAssets.wealthImage,
                          height: 100,
                          //width: 100,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          "Badge",
                          style: getsemiboldStyle(color: ColorManager.white),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(
                          ImageAssets.AvatarFrameImage,
                          height: 100,
                          // width: 100,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          "Avator Frame",
                          style: getsemiboldStyle(color: ColorManager.white),
                        ),
                      ],
                    ),
                    // SizedBox(height: 10.0),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Text(
                    //         "You need 5,500 wealth points to complete level task",
                    //         style: getsemiboldStyle(color: ColorManager.white),
                    //       ),
                    //       Text(
                    //         "14 days 06:06:47",
                    //         style: getsemiboldStyle(color: ColorManager.white),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(height: 10.0),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 54),
            child: Container(
              width: AppSize.sizeWidth(context) / 2,
              height: 30,
              decoration: BoxDecoration(
                  color: ColorManager.orangeColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                  )),
              child: Center(
                  child: Text(
                "Class Priviledge",
                style: getsemiboldStyle(
                    color: ColorManager.white, fontSize: 14.mv),
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget followersPosts() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.vs),
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "500",
                  style: getsemiboldStyle(
                      color: ColorManager.white, fontSize: AppSize.s14.mv),
                ),
                SizedBox(height: 3.0),
                Text(
                  "Posts",
                  style: getmediumStyle(
                      color: ColorManager.hinttextdarkColor,
                      fontSize: AppSize.s12.mv),
                ),
              ],
            ),
            Container(
              height: 50,
              width: 1.0,
              color: ColorManager.lightGrey,
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, Routes.FollowerViewRoute),
              child: Column(
                children: [
                  Text(
                    "600K",
                    style: getsemiboldStyle(
                        color: ColorManager.white, fontSize: AppSize.s14.mv),
                  ),
                  SizedBox(height: 3.0),
                  Text(
                    "Followers",
                    style: getmediumStyle(
                        color: ColorManager.hinttextdarkColor,
                        fontSize: AppSize.s12.mv),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: 1.0,
              color: ColorManager.lightGrey,
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, Routes.FollowingViewRoute),
              child: Column(
                children: [
                  Text(
                    "60",
                    style: getsemiboldStyle(
                        color: ColorManager.white, fontSize: AppSize.s14.mv),
                  ),
                  SizedBox(height: 3.0),
                  Text(
                    "Followings",
                    style: getmediumStyle(
                        color: ColorManager.hinttextdarkColor,
                        fontSize: AppSize.s12.mv),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget exclusivePriviledge() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: AppSize.sizeWidth(context),
            decoration: BoxDecoration(
              color: ColorManager.primarydarkdarkColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Image.asset(
                  ImageAssets.wealthImage,
                  height: 150,
                  width: 100,
                ),
                Text(
                  "Wealth Class Locked",
                  style: getsemiboldStyle(color: ColorManager.white),
                ),
                SizedBox(height: 10.0),
                LinearPercentIndicator(
                  lineHeight: 16.0,
                  percent: 0.3,
                  backgroundColor: Colors.grey,
                  progressColor: ColorManager.primary,
                  barRadius: Radius.circular(10.0),
                ),
                SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "You need 5,500 wealth points to complete level task",
                          style: getsemiboldStyle(color: ColorManager.white),
                        ),
                      ),
                      Text(
                        "14 days 06:06:47",
                        style: getsemiboldStyle(color: ColorManager.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
          Container(
            width: AppSize.sizeWidth(context) / 2,
            height: 30,
            decoration: BoxDecoration(
                color: ColorManager.grey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                )),
            child: Center(
                child: Text(
              "Exclusive Priviledge",
              style:
                  getsemiboldStyle(color: ColorManager.white, fontSize: 14.mv),
            )),
          ),
        ],
      ),
    );
  }

  Widget hotwidget() {
    return ToggleButtonList(
      selected: selectedid,
      callback: (int index) {
        setState(() {
          selectedid = index;
        });
        //pageController.jumpToPage(index);
      },
      categories: _categories,
    );
  }
}
