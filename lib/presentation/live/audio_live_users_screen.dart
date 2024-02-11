// ignore_for_file: deprecated_member_use

import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/presentation/resources/index_manager.dart';
import 'package:stream_up_live/widgets/stacked_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AudioLiveUsersView extends StatefulWidget {
  const AudioLiveUsersView({Key? key}) : super(key: key);

  @override
  State<AudioLiveUsersView> createState() => _AudioLiveUsersViewState();
}

class _AudioLiveUsersViewState extends State<AudioLiveUsersView>
    with SingleTickerProviderStateMixin {
  int selectedid = 0;
  List FresherUserList = [
    ImageAssets.audioliveUserImage,
    ImageAssets.streamUser2Image,
    ImageAssets.streamUser3Image,
    ImageAssets.streamUser4Image,
    ImageAssets.streamUser5Image,
    ImageAssets.streamUser6Image,
    ImageAssets.streamUser7Image,
    ImageAssets.streamUser8Image,
    ImageAssets.streamUser9Image,
  ];
  late TabController _controller;
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondarydarkColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            //  width: AppSize.sizeWidth(context),
            // height: AppSize.sizeHeight(context),
            child: Padding(
              padding: EdgeInsets.only(left: 15.0, right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  totalLiveUser(),
                  onlineUser(),
                  Container(
                    alignment: Alignment.bottomLeft,
                    height: 210,
                    width: 230,
                    child: ListView.separated(
                        //physics: NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 10.0),
                        itemBuilder: (context, i) {
                          return commentBox();
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            bottombar(iconPath: ImageAssets.commentwIcon),
                            SizedBox(width: 10.0),
                            bottombar(iconPath: ImageAssets.imogeIcon),
                            SizedBox(width: 10.0),
                            bottombar(iconPath: ImageAssets.phonemicIcon),
                          ],
                        ),
                        Row(
                          children: [
                            bottombar(iconPath: ImageAssets.heartIcon),
                            SizedBox(width: 10.0),
                            Container(
                              decoration: BoxDecoration(
                                color:
                                    ColorManager.blackBorder.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(
                                  ImageAssets.giftIcon,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.0),
                            pkbutton(),
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
      ),
    );
  }

  Widget totalLiveUser() {
    return SizedBox(
      width: 75,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: ColorManager.blackBorder.withOpacity(0.5),
                borderRadius: BorderRadius.circular(15.0)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    ImageAssets.fireIcon,
                    height: 16,
                    width: 16,
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    "37.8k",
                    style: getmediumStyle(
                        color: ColorManager.whiteColor, fontSize: 12.mv),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  color: ColorManager.primary, shape: BoxShape.circle),
            ),
          ),
        ],
      ),
    );
  }

  Widget onlineUser() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: Container(
        // height: 500,
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8
              //mainAxisExtent: 295, // here set custom Height You Want
              ),
          shrinkWrap: true,
          itemCount: FresherUserList.length,
          itemBuilder: (BuildContext context, int index) {
            return userbox(
                index: index,
                imagePath: FresherUserList[index],
                isLive: index == 0 ? true : false,
                onTap: () {
                  // if (index == 1 || index == 2 || index == 5) {
                  //   Navigator.pushNamed(context, Routes.PublicProfilePageRoute);
                  // } else {
                  //   Navigator.pushNamed(context, Routes.liveViewRoute);
                  // }
                });
          },
          //),
        ),
      ),
    );
  }

  Widget userbox(
      {String? imagePath, Function()? onTap, bool? isLive, int? index}) {
    if (isLive ?? false) {
      return InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.darken),
              fit: BoxFit.cover,
              image: AssetImage(imagePath!),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorManager.blackBorder.withOpacity(0.4)),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text("0${index! + 1}",
                          style: getmediumStyle(color: Colors.white)),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6.0, vertical: 4.0),
                        child: Text(
                          "Room Master ..",
                          style: getsemiboldStyle(
                              color: ColorManager.white, fontSize: 7.mv),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorManager.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: SvgPicture.asset(
                          ImageAssets.audioliveIcon,
                          height: 10,
                          width: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: ColorManager.primarydarkdarkColor),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorManager.blackColor.withOpacity(0.4)),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text("0${index! + 1}",
                        style: getmediumStyle(color: Colors.white)),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    ImageAssets.audioliveIcon,
                    height: 30,
                    width: 30,
                  )),
            ],
          ),
        ),
      );
    }
  }

  Widget pkbutton() {
    return Container(
      height: 40,
      width: 40,
      decoration:
          BoxDecoration(color: ColorManager.primary, shape: BoxShape.circle),
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
        color: ColorManager.blackBorder.withOpacity(0.2),
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
                color: ColorManager.primary,
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
      height: 42,
      width: 42,
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
        padding: const EdgeInsets.fromLTRB(3, 3, 3, 3),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(ImageAssets.starUserImage4),
            ),
            SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("John Smith Room",
                    style: getsemiboldStyle(color: ColorManager.white)),
                Text(
                  "ID: 123456789",
                  style: getmediumStyle(color: ColorManager.white),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: ColorManager.green),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    ImageAssets.audioUseractiveIcon,
                  ),
                ),
              ),
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
        GestureDetector(
          onTap: (() {
            _LiveUsersBottomSheet(context);
          }),
          child: Container(
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

  void _LiveUsersBottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        // ColorManager.secondarydarkColor,
        context: context,

        // barrierColor: ColorManager.primary,
        isScrollControlled: true,
        builder: (context) {
          return SingleChildScrollView(
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    height: AppSize.sizeHeight(context) / 1.5,
                    decoration: BoxDecoration(
                      color: ColorManager.secondarydarkColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.0),
                        topRight: const Radius.circular(18.0),
                      ),
                    ),
                    child: DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TabBar(
                                controller: _controller,
                                indicatorColor: ColorManager.primary,
                                labelColor: ColorManager.primary,
                                unselectedLabelColor:
                                    ColorManager.hinttextdarkColor,
                                labelStyle: getsemiboldStyle(
                                    color: ColorManager.primary,
                                    fontSize: 14.mv),
                                tabs: [
                                  Tab(
                                    text: "Viewers(60)",
                                  ),
                                  Tab(
                                    text: "Guests",
                                  ),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _controller,
                                  children: <Widget>[
                                    ListView.separated(
                                        itemCount: 10,
                                        separatorBuilder: (context, i) =>
                                            Divider(color: ColorManager.grey),
                                        itemBuilder: (context, index) {
                                          double cw =
                                              AppSize.sizeWidth(context) / 3.3;
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: ColorManager.primary,
                                                    shape: BoxShape.circle),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(2.0),
                                                  child: CircleAvatar(
                                                    radius: 30.0,
                                                    backgroundImage: AssetImage(
                                                        ImageAssets
                                                            .starUserImage4),
                                                  ),
                                                ),
                                              ),
                                              //column
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 4.0,
                                                          vertical: 10.0),
                                                      child: Text(
                                                        "James Olivia",
                                                        style: getmediumStyle(
                                                            fontSize: 14.mv,
                                                            color: ColorManager
                                                                .white),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 4.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: cw / 2.5,
                                                            decoration: BoxDecoration(
                                                                color:
                                                                    ColorManager
                                                                        .darkblue,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          5.0),
                                                              child: Center(
                                                                child: Text(
                                                                  "Lv.09",
                                                                  style: getsemiboldStyle(
                                                                      color: ColorManager
                                                                          .white,
                                                                      fontSize:
                                                                          8.mv),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 5.0),
                                                          Container(
                                                            width: cw / 2.5,
                                                            decoration: BoxDecoration(
                                                                color: ColorManager
                                                                    .gradientColor,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15.0)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          5.0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  SvgPicture
                                                                      .asset(
                                                                    ImageAssets
                                                                        .crownIcon,
                                                                    height: 12,
                                                                    width: 12,
                                                                  ),
                                                                  SizedBox(
                                                                      width:
                                                                          3.0),
                                                                  Text(
                                                                    "06",
                                                                    style: getsemiboldStyle(
                                                                        color: ColorManager
                                                                            .white,
                                                                        fontSize:
                                                                            8.mv),
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
                                              )
                                            ],
                                          );
                                        }),

                                    //Container
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Guest Live (0)",
                                            style: getmediumStyle(
                                                fontSize: 14.mv,
                                                color: ColorManager
                                                    .hinttextdarkColor),
                                          ),
                                        ),
                                        Container(
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: ColorManager.primary,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                buildStackedImages(),
                                                SizedBox(width: 5.0),
                                                Flexible(
                                                  child: Text(
                                                    "Meet up with new friends via Match! ",
                                                    style: getsemiboldStyle(
                                                        fontSize: 12.mv,
                                                        color:
                                                            ColorManager.white),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: ColorManager.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0)),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 10.0,
                                                        horizontal: 10.0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        SvgPicture.asset(
                                                          ImageAssets.matchIcon,
                                                          height: 12,
                                                          width: 12,
                                                        ),
                                                        SizedBox(width: 3.0),
                                                        Text(
                                                          "Match",
                                                          style: getsemiboldStyle(
                                                              color: ColorManager
                                                                  .blackColor,
                                                              fontSize: 8.mv),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ]),
                      ),
                    ));
              }),
            ),
          );
        });
  }

  Widget buildStackedImages() {
    final double size = 50;
    final imageList = [
      ImageAssets.starUserImage1,
      ImageAssets.starUserImage2,
    ];
    final items = imageList.map((imagepath) => buildImage(imagepath)).toList();
    return Stackedwidget(
      items: items,
      size: size,
    );
  }

  Widget buildImage(String imagePath) {
    final double bordersize = AppPadding.p2;
    return ClipOval(
      child: Container(
          color: ColorManager.white,
          padding: EdgeInsets.all(bordersize),
          child: ClipOval(child: Image.asset(imagePath, fit: BoxFit.cover))),
    );
  }
}
