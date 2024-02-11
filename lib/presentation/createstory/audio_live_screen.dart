// ignore_for_file: deprecated_member_use

import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '../../widgets/index_widget.dart';
import '../resources/index_manager.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';

class AudioLiveView extends StatefulWidget {
  const AudioLiveView({Key? key}) : super(key: key);

  @override
  State<AudioLiveView> createState() => _AudioLiveViewState();
}

class _AudioLiveViewState extends State<AudioLiveView> {
  List tags = [
    "#Chat",
    "#Singing",
    "#Travel",
    "#Dancing",
    "#Dancing",
    "#Singing"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: AppSize.sizeWidth(context),
          color: ColorManager.primarydarkdarkColor,
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //         colorFilter: ColorFilter.mode(
          //             Colors.black.withOpacity(0.4), BlendMode.darken),
          //         image: AssetImage(ImageAssets.createLivebgImage),
          //         fit: BoxFit.cover)),
          child: Container(
            height: AppSize.sizeHeight(context),
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  right: 10,
                  child: InkWell(
                    onTap: (() => Navigator.pop(context)),
                    child: SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset(
                          ImageAssets.cancelIcon,
                          color: ColorManager.white,
                        )),
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 20,
                  right: 20,
                  child: Container(
                    width: AppSize.sizeWidth(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: ColorManager.blackColor.withOpacity(0.3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Stack(
                            children: [
                              Container(height: 80, width: 80),
                              Container(
                                height: 77,
                                width: 77,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  // borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage(ImageAssets.newUser1Image),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0.0,
                                right: 0.0,
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorManager.blackColor
                                        .withOpacity(0.4),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: SvgPicture.asset(
                                        ImageAssets.cameraIcon,
                                      )),
                                ),
                              )
                            ],
                          ),
                          SizedBox(width: 16),
                          Container(
                            color: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Add a tittle a chat",
                                  style: TextStyle(
                                      fontSize: 18.mv,
                                      color: ColorManager.white),
                                ),
                                SizedBox(height: 6),
                                Row(
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: SvgPicture.asset(
                                          ImageAssets.multiliveIcon,
                                          color: ColorManager.white,
                                        )),
                                    Text(
                                      "Public",
                                      style: TextStyle(
                                          fontSize: 16.mv,
                                          color: ColorManager.white,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 180,
                  left: 20,
                  right: 20,
                  child: Container(
                    width: AppSize.sizeWidth(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: ColorManager.blackColor.withOpacity(0.3),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Select Tag",
                            style: getmediumStyle(
                                color: ColorManager.white, fontSize: 14.mv),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                            height: 25,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: tags.length,
                              separatorBuilder: (context, i) =>
                                  SizedBox(width: 5.0),
                              itemBuilder: (context, index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: ColorManager.grey,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 5.0),
                                    child: Text(
                                      tags[index],
                                      style:
                                          getRegularStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                        inputFiled(),
                      ],
                    ),
                  ),
                ),
                bottomBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomBox() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: AppSize.sizeWidth(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10.0),
              //---------------Go live Button-----------------
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.sizeWidth(context) * 0.10,
                    vertical: 10.0),
                child: CustomButton(
                    color: ColorManager.primary,
                    text: "GO LIVE",
                    style: getboldStyle(
                      color: ColorManager.white,
                      fontSize: AppSize.s12.mv,
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                          context, Routes.AudioLiveUsersViewRoute);
                    }),
              ),
              SizedBox(height: 10.0),
              //----------------------live audio live---------
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              color: ColorManager.blackColor.withOpacity(0.3),
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset(ImageAssets.cameraIcon),
                            )),
                        Text(
                          "LIVE",
                          style: getmediumStyle(color: ColorManager.white),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: ColorManager.green,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(ImageAssets.audioliveIcon),
                          ),
                        ),
                        Text(
                          "Audio LIVE",
                          style: getmediumStyle(color: ColorManager.white),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              color: ColorManager.blackColor.withOpacity(0.3),
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child:
                                  SvgPicture.asset(ImageAssets.multiliveIcon),
                            )),
                        Text(
                          "Multiple LIVE",
                          style: getmediumStyle(color: ColorManager.white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputFiled() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        // maxLines: 2,
        style: TextStyle(color: ColorManager.white),
        decoration: InputDecoration(
          hintText: 'Enter a text',
          hintStyle: getsemiboldStyle(color: ColorManager.white),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
