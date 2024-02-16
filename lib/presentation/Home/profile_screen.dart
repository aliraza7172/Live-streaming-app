// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stream_up_live/controller/profile_controller.dart';
import 'package:stream_up_live/data/model/body/login_user_model.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/widgets/toggle_button_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../resources/index_manager.dart';
import '../resources/list.dart';

class ChoiceModel {
  const ChoiceModel({this.title, this.iconpath, this.color});
  final String? title;
  final String? iconpath;
  final Color? color;
}

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  List<ChoiceModel> Choics = <ChoiceModel>[
    ChoiceModel(
        title: 'Top-up',
        iconpath: ImageAssets.topUpIcon,
        color: ColorManager.topupColor),
    ChoiceModel(
        title: 'Earnings',
        iconpath: ImageAssets.earningsIcon,
        color: ColorManager.earningColor),
    ChoiceModel(
        title: 'My Tasks',
        iconpath: ImageAssets.mytaskIcon,
        color: ColorManager.mytaskColor),
    ChoiceModel(
        title: 'Vip',
        iconpath: ImageAssets.vipIcon,
        color: ColorManager.vipColor),
    ChoiceModel(
        title: 'Store',
        iconpath: ImageAssets.storeIcon,
        color: ColorManager.storeColor),
    ChoiceModel(
        title: 'My Bag',
        iconpath: ImageAssets.mybagIcon,
        color: ColorManager.mybadgeColor),
    ChoiceModel(
        title: 'My Level',
        iconpath: ImageAssets.mylevelIcon,
        color: ColorManager.mylavelColor),
    ChoiceModel(
        title: 'My Badge',
        iconpath: ImageAssets.myBadgeIcon,
        color: ColorManager.mybadgeColor),
    ChoiceModel(
        title: 'Help',
        iconpath: ImageAssets.helpIcon,
        color: ColorManager.helpColor),
    ChoiceModel(
        title: 'Edit Profile',
        iconpath: ImageAssets.editProfileIcon,
        color: ColorManager.editProfileColor),
    ChoiceModel(
        title: 'My Invites',
        iconpath: ImageAssets.myInvitesIcon,
        color: ColorManager.myinvitesColor),
    ChoiceModel(
        title: 'Settings',
        iconpath: ImageAssets.settings1Icon,
        color: ColorManager.settingsColor),
    ChoiceModel(
        title: 'Wealth',
        iconpath: ImageAssets.myBadgeIcon,
        color: ColorManager.settingsColor),
    ChoiceModel(
        title: 'Live Data',
        iconpath: ImageAssets.myBadgeIcon,
        color: ColorManager.settingsColor),
    ChoiceModel(
        title: 'Leaderboard',
        iconpath: ImageAssets.myBadgeIcon,
        color: ColorManager.settingsColor),
  ];

  List choicsRoute = [
    Routes.TopUpViewPageRoute,
    Routes.EarningViewPageRoute,
    Routes.MyTasksViewRoute,
    Routes.VipViewRoute,
    Routes.storeViewPageRoute,
    Routes.MyBagViewRoute,
    Routes.MyLevelPageRoute,
    Routes.MyBadgeViewRoute,
    Routes.HelpSupportViewRoute,
    Routes.EditProfileViewRoute,
    Routes.MyInvitesViewRoute,
    Routes.SettingViewRoute,
    Routes.WealthClassViewRoute,
    Routes.LiveDataViewRoute,
    Routes.LeaderboardViewRoute,
  ];

  List _categories = [
    "Live Videos",
    AppStrings.pkVideos,
    "Posts",
    AppStrings.popular,
    AppStrings.Events,
    AppStrings.Party,
  ];
  int selectedid = 0;
  var box = GetStorage();
  LoginUserModel user = LoginUserModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var loginUser = box.read(LocalDBStrings.login_user);
    try {
      if (loginUser != null) {
        var decodedUser = jsonDecode(loginUser);
        user = LoginUserModel.fromJson(decodedUser);
      } else {
        Navigator.pushReplacementNamed(context, Routes.loginRoute);
      }
    } catch (e) {
      debugPrint("catch:$e");
    }
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (_) {
          return SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(height: 40.vs),
                header(user, _),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    user.data!.user!.about.toString()!="null"?user.data!.user!.about.toString():"",
                    textAlign: TextAlign.center,
                    style:
                        getRegularStyle(color: ColorManager.hinttextdarkColor),
                  ),
                ),
                SizedBox(height: 10),
                followersPosts(),
                SizedBox(height: 10),
                GridView.builder(
                  padding: EdgeInsets.all(5.0),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: Choics.length,
                  itemBuilder: (context, index) {
                    return profilegridview(
                        Choics[index], (() => Navigator.pushNamed(context, choicsRoute[index])));
                  },
                ),
                Categories(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 5.0),
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 295, // here set custom Height You Want
                    ),
                    shrinkWrap: true,
                    itemCount: Lists.FresherUserList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: (() => Navigator.pushNamed(
                              context, Routes.liveViewRoute)),
                          child: userbox(
                              imagePath: Lists.FresherUserList[index],
                              name: Lists.storiesname[index]));
                    },
                    //),
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget userbox({String? imagePath, String? name}) {
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
                  child:
                      Text(name!, style: getmediumStyle(color: Colors.white)),
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
                backgroundImage: AssetImage(imagePath),
              ),
            ),
          ),
          title: Text(
            name,
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

  Widget profilegridview(ChoiceModel profiledata, Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: ColorManager.primarydarkdarkColor,
              //profiledata.color,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SvgPicture.asset(
                    color: ColorManager.white,
                  profiledata.iconpath ?? ImageAssets.userIcon),
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            width: 60,
            child: Center(
              child: Text(
                profiledata.title ?? "",
                style:
                    getsemiboldStyle(color: ColorManager.white, fontSize: 9.mv
                        //AppSize.s10.mv
                        ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget header(LoginUserModel user, ProfileController controller) {
    return Stack(
      children: [
        Container(
          height: 250,
          width: AppSize.sizeWidth(context),
        ),
        Container(
          height: 200,
          width: AppSize.sizeWidth(context),
          child: CachedNetworkImage(
            imageUrl: user.data!.baseUrl.toString()+"/"+user.data!.user!.banner.toString(),
            placeholder: (context, url) => CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 10,
                child: const CircularProgressIndicator()),
            errorWidget: (context, url, error) => Container(
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  colorFilter:
                      ColorFilter.mode(Colors.black12, BlendMode.darken),
                  fit: BoxFit.cover,
                  image: AssetImage(ImageAssets.background_defaultImage),
                ),
              ),
            ),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                  image:
                      DecorationImage(fit: BoxFit.cover, image: imageProvider)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Wrap(
                          children: [
                            InkWell(
                              onTap: () async {
                                Navigator.pop(context);
                                File? file =
                                    await pickImage(ImageSource.gallery);
                                if (file != null) {
                                  controller.postImageData(
                                      file,
                                      AppStrings.UPLOAD_BANNER,
                                      user).then((value) {
                                        setState(() {});
                                  });
                                }
                                print("=====gallery============");
                              },
                              child: ListTile(
                                leading: Icon(
                                  Icons.image_outlined,
                                  color: ColorManager.primarydarkdarkColor,
                                ),
                                title: Text("Gallery"),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                Navigator.pop(context);
                                File? file =
                                    await pickImage(ImageSource.camera);
                                if (file != null) {
                                  controller.postImageData(
                                      file,
                                      AppStrings.UPLOAD_BANNER,
                                      user).then((value) {
                                        setState(() {});
                                  });
                                }
                                print("=====camera============");
                                controller.image = file;
                                controller.update();
                              },
                              child: ListTile(
                                leading: Icon(
                                  Icons.camera_alt,
                                  color: ColorManager.primarydarkdarkColor,
                                ),
                                title: Text("Camera"),
                              ),
                            ),
                          ],
                        );
                      });
                },
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      color: ColorManager.blackColor.withOpacity(0.3),
                      shape: BoxShape.circle),
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: SvgPicture.asset(
                      ImageAssets.picCameraIcon,
                      color: ColorManager.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0.0,
          left: 30.0,
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                      decoration: BoxDecoration(
                          color: ColorManager.secondarydarkColor,
                          shape: BoxShape.circle),
                      child:user.data!.user!.image==null? Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CircleAvatar(
                          radius: 40.0,
                          backgroundImage:
                          AssetImage(ImageAssets.user_defaultImage),
                        ),
                      ):
                      CachedNetworkImage(
                        imageUrl: user.data!.baseUrl.toString()+"/"+user.data!.user!.image.toString(),
                        placeholder: (context, url) =>
                            CircleAvatar(
                              radius: 10,
                                child: const CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Container(),
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover, image: imageProvider)),
                        ),
                      )
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 0.0,
                    child: InkWell(
                      onTap: () async {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Wrap(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      Navigator.pop(context);
                                      File? file =
                                          await pickImage(ImageSource.gallery);
                                      if (file != null) {
                                        controller.postImageData(
                                            file,
                                            AppStrings.UPLOAD_PROFILE,
                                            user).then((value) {
                                          setState(() {});
                                        });
                                      }
                                      print("=====gallery============");
                                    },
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.image_outlined,
                                        color:
                                            ColorManager.primarydarkdarkColor,
                                      ),
                                      title: Text("Gallery"),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      Navigator.pop(context);
                                      File? file =
                                          await pickImage(ImageSource.camera);
                                      if (file != null) {
                                        controller.postImageData(
                                            file,
                                            AppStrings.UPLOAD_PROFILE,
                                            user).then((value) {
                                              setState(() {

                                              });
                                        });
                                      }
                                      print("=====camera============");
                                      controller.image = file;
                                      controller.update();
                                    },
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.camera_alt,
                                        color:
                                            ColorManager.primarydarkdarkColor,
                                      ),
                                      title: Text("Camera"),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //     color: ColorManager.whiteColor, width: 2.0),
                              color: ColorManager.primarydarkdarkColor,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child:
                                  SvgPicture.asset(ImageAssets.picCameraIcon),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30.0),
                    Text(
                        user.data!.user!.nickName.toString()=="null"?
                      user.data!.user!.fullName.toString():user.data!.user!.nickName.toString(),
                      style: getsemiboldStyle(
                        color: ColorManager.white,
                        fontSize: 16.mv,
                      ),
                    ),
                    Text(
                      user.data!.user!.countryName.toString()!="null"?
                      user.data!.user!.countryName.toString():"",
                      style: getmediumStyle(
                          color: ColorManager.hinttextdarkColor,
                          fontSize: 12.mv),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<File?> pickImage(ImageSource source) async {
    // final InputImage inputImage;
    final image = await ImagePicker().pickImage(
      source: source,
    );
    if (image != null) {
      print("=Image=${image.path}==============");
      return File(image.path);
    } else {
      return null;
    }
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
}
