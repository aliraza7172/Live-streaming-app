// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/presentation/resources/index_manager.dart';

class MyBadgeViewPage extends StatefulWidget {
  const MyBadgeViewPage({Key? key}) : super(key: key);

  @override
  State<MyBadgeViewPage> createState() => _MyBadgeViewPageState();
}

class _MyBadgeViewPageState extends State<MyBadgeViewPage> {
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
          "My Badge",
          style: getsemiboldStyle(
              color: ColorManager.white, fontSize: AppSize.s16.mv),
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.circular(15.0)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
                child: Center(
                  child: Text(
                    "CLOSE",
                    style: getsemiboldStyle(
                        color: ColorManager.white, fontSize: 8.mv),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            toggleButton(tex1: "Honor Badges", text2: "Event Badges"),
            Divider(color: ColorManager.grey, thickness: 3.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Rocket Badge",
                style:
                    getmediumStyle(color: ColorManager.white, fontSize: 14.mv),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 15.0,
                children: List.generate(
                    5,
                    (index) => Column(
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  // colorFilter: ColorFilter.mode(
                                  //     Colors.black.withOpacity(0.3),
                                  //     BlendMode.darken),
                                  fit: BoxFit.cover,
                                  image: AssetImage(index == 0
                                      ? ImageAssets.rocketcolorImage
                                      : ImageAssets.RocketnoColorImage),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Rocket Boy",
                                style: getsemiboldStyle(
                                    color: ColorManager.white, fontSize: 12.mv),
                              ),
                            ),
                          ],
                        )),
              ),
            ),
            Divider(color: ColorManager.grey, thickness: 3.0),
            //----------
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Sky Blue Heros Badge",
                style:
                    getmediumStyle(color: ColorManager.white, fontSize: 14.mv),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 15.0,
                children: List.generate(
                    5,
                    (index) => Column(
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  // colorFilter: ColorFilter.mode(
                                  //     Colors.black.withOpacity(0.3),
                                  //     BlendMode.darken),
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage(ImageAssets.plannoColorImage),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Rocket Boy",
                                style: getsemiboldStyle(
                                    color: ColorManager.white, fontSize: 12.mv),
                              ),
                            ),
                          ],
                        )),
              ),
            ),
          ],
        ),
      ),
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
                  // border: Border.all(color: ColorManager.primary),
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
