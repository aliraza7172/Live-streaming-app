// ignore_for_file: deprecated_member_use

import 'package:stream_up_live/presentation/resources/index_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PeopleLive extends StatefulWidget {
  const PeopleLive({Key? key}) : super(key: key);

  @override
  State<PeopleLive> createState() => _PeopleLiveState();
}

class _PeopleLiveState extends State<PeopleLive> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: ColorManager.livebgColor,
          //.withOpacity(0.22),
          height: AppSize.sizeHeight(context),
          child: Padding(
            padding: EdgeInsets.only(left: 15.0, right: 10.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      userCoin(),
                      userliveviewer(),
                    ],
                  ),
                ),
                Container(
                  height: 280,
                  //color: ColorManager.orangeColor,
                  child: Row(
                    children: [
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(ImageAssets.liveuser),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          // height: 280,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(ImageAssets.starUserImage2),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    height: 210,
                    width: 230,
                    child: ListView.separated(
                        itemCount: 10,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10.0),
                        itemBuilder: (context, i) {
                          return commentBox();
                        }),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child:
                      //  Align(
                      //   alignment: Alignment.bottomCenter,
                      //   child:
                      Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          bottombar(iconPath: ImageAssets.commentwIcon),
                          SizedBox(width: 10.0),
                          bottombar(iconPath: ImageAssets.menueIcon),
                          SizedBox(width: 10.0),
                          bottombar(iconPath: ImageAssets.user2Icon),
                        ],
                      ),
                      pkbutton(),
                      // SizedBox(
                      //   // height: 40,
                      //   // width: 40,
                      //   child: SvgPicture.asset(
                      //     ImageAssets.giftBox1Icon,
                      //   ),
                      // ),
                    ],
                    // ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget pkbutton() {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: ColorManager.orangeColor, shape: BoxShape.circle),
      child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Center(
            child: Text(
              "PK",
              style: getmediumStyle(
                color: ColorManager.white,
              ),
            ),
          )),
    );
  }

  Widget commentBox() {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.blackBorder.withOpacity(0.5),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipOval(
              child: Container(
                height: 25,
                width: 25,
                color: ColorManager.blueSolid,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(ImageAssets.starIcon),
                ),
              ),
            ),
            SizedBox(width: 6.0),
            SizedBox(
              child: Text("arssalan gujjar: hi",
                  maxLines: 3,
                  style: getsemiboldStyle(color: ColorManager.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottombar({String? iconPath}) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.blackBorder.withOpacity(0.5),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(iconPath!, color: ColorManager.white),
      ),
    );
  }

  Widget userCoin() {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.blackBorder.withOpacity(0.5),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(3, 3, 14, 3),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(ImageAssets.starUserImage4),
            ),
            SizedBox(width: 5.0),
            Column(
              children: [
                Text("Jmes Olivia",
                    style: getsemiboldStyle(color: ColorManager.white)),
                Row(
                  children: [
                    SvgPicture.asset(ImageAssets.beansIcon),
                    Text(
                      "123456",
                      style: getmediumStyle(color: ColorManager.white),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget userliveviewer() {
    return Row(
      children: [
        CircleAvatar(backgroundImage: AssetImage(ImageAssets.starUserImage4)),
        SizedBox(width: 10.0),
        Container(
          decoration: BoxDecoration(
            color: ColorManager.blackBorder.withOpacity(0.5),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "256",
              style: getmediumStyle(color: ColorManager.white),
            ),
          ),
        ),
        SizedBox(width: 10.0),
        GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: SvgPicture.asset(ImageAssets.cancelIcon)),
        SizedBox(width: 6.0),
        //ImageAssets
      ],
    );
  }
}
