// ignore_for_file: deprecated_member_use

import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/widgets/toggle_button_list.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../resources/index_manager.dart';

class PublicProfilePage extends StatefulWidget {
  const PublicProfilePage({Key? key}) : super(key: key);

  @override
  State<PublicProfilePage> createState() => _PublicProfilePageState();
}

class _PublicProfilePageState extends State<PublicProfilePage> {
  List _categories = [
    "Live Videos",
    AppStrings.pkVideos,
    "Posts",
    AppStrings.popular,
    AppStrings.Events,
    AppStrings.Party,
  ];
  List FresherUserList = [
    ImageAssets.streamUser1Image,
    ImageAssets.streamUser2Image,
    ImageAssets.streamUser3Image,
    ImageAssets.streamUser4Image,
    ImageAssets.streamUser5Image,
    ImageAssets.streamUser6Image,
    ImageAssets.streamUser7Image,
    ImageAssets.streamUser8Image,
    ImageAssets.streamUser9Image,
    ImageAssets.streamUser10Image,
  ];
  int selectedid = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondarydarkColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40.vs),
            header(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                AppStrings.loremipsum3lines,
                textAlign: TextAlign.center,
                style: getRegularStyle(color: ColorManager.hinttextdarkColor),
              ),
            ),
            SizedBox(height: 10),
            followersPosts(),
            SizedBox(height: 10),
            Categories(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 295, // here set custom Height You Want
                ),

                shrinkWrap: true,
                itemCount: FresherUserList.length,
                itemBuilder: (BuildContext context, int index) {
                  return userbox(imagePath: FresherUserList[index]);
                },
                //),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget userbox({String? imagePath}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 220,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: ColorManager.blackBorder.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(ImageAssets.volumeIcon),
                            SizedBox(width: AppSize.s4),
                            Text(
                              "451",
                              style: getsemiboldStyle(
                                  color: ColorManager.white, fontSize: 7.mv),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              ImageAssets.cameraIcon,
                              height: 8,
                              width: 8,
                            ),
                            SizedBox(width: AppSize.s4),
                            Text(
                              "LIVE",
                              style: getsemiboldStyle(
                                  color: ColorManager.white, fontSize: 7.mv),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text("James Olivia",
                      style: getmediumStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            decoration: BoxDecoration(
                color: ColorManager.primary, shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: CircleAvatar(
                radius: 16.0,
                backgroundImage: AssetImage(ImageAssets.starUserImage4),
              ),
            ),
          ),
          title: Text(
            "James Olivia",
            style: TextStyle(fontSize: 12.mv, color: ColorManager.white),
          ),
          subtitle: Text(
            "100k Following",
            style: TextStyle(
                fontSize: 10.mv, color: ColorManager.greydarkThemeColor),
          ),
        ),
      ],
    );
  }

  Widget Categories() {
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

  Widget header() {
    return Stack(
      children: [
        Container(
          height: 250,
          width: AppSize.sizeWidth(context),
          // color: Colors.green,
        ),
        Container(
          height: 200,
          width: AppSize.sizeWidth(context),
          // color: Colors.yellow,
          decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken),
              fit: BoxFit.cover,
              image: AssetImage(ImageAssets.publicProfileUserImage),
            ),
          ),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (() => Navigator.pop(context)),
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: ColorManager.blackColor.withOpacity(0.3),
                        shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SvgPicture.asset(ImageAssets.arrowbackIcon,
                          color: ColorManager.white),
                    ),
                  ),
                ),
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      color: ColorManager.blackColor.withOpacity(0.3),
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: SvgPicture.asset(
                      ImageAssets.threedotsIcon,
                      color: ColorManager.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          left: 30.0,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: ColorManager.secondarydarkColor,
                    shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundImage: AssetImage(ImageAssets.starUserImage2),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(height: 30.0),
                    Text(
                      "James Olivia",
                      style: getsemiboldStyle(
                        color: ColorManager.white,
                        fontSize: 16.mv,
                      ),
                    ),
                    Text(
                      "New York, USA",
                      style: getmediumStyle(
                          color: ColorManager.hinttextdarkColor,
                          fontSize: 12.mv),
                    )
                  ],
                ),
              ),
              SizedBox(width: 50.hs),
              Column(
                children: [
                  SizedBox(height: 30.0),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 5.0),
                      child: Text("Follow",
                          style: getmediumStyle(color: ColorManager.white)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
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
            Column(
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
            Container(
              height: 50,
              width: 1.0,
              color: ColorManager.lightGrey,
            ),
            Column(
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
            )
          ],
        ),
      ),
    );
  }
}
