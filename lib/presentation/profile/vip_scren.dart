// ignore_for_file: deprecated_member_use

import 'package:stream_up_live/presentation/Home/profile_screen.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/index_widget.dart';
import '../resources/index_manager.dart';

class VipViewPage extends StatefulWidget {
  const VipViewPage({Key? key}) : super(key: key);

  @override
  State<VipViewPage> createState() => _VipViewPageState();
}

class _VipViewPageState extends State<VipViewPage> {
  List<ChoiceModel> Choics = <ChoiceModel>[
    ChoiceModel(
        title: 'Limitless Chat',
        iconpath: ImageAssets.limitlessChatIcon,
        color: ColorManager.topupColor),
    ChoiceModel(
        title: 'Video Chat',
        iconpath: ImageAssets.videoChatIcon,
        color: ColorManager.earningColor),
    ChoiceModel(
        title: 'Safety',
        iconpath: ImageAssets.saftyIcon,
        color: ColorManager.mytaskColor),
    ChoiceModel(
        title: 'Mute',
        iconpath: ImageAssets.muteIcon,
        color: ColorManager.vipColor),
    ChoiceModel(
        title: 'Badge',
        iconpath: ImageAssets.badgeIcon,
        color: ColorManager.storeColor),
    ChoiceModel(
        title: 'Rank Bost',
        iconpath: ImageAssets.rankBostIcon,
        color: ColorManager.mybadgeColor),
    ChoiceModel(
        title: 'Cool Emoji',
        iconpath: ImageAssets.coolImogeIcon,
        color: ColorManager.mylavelColor),
    ChoiceModel(
        title: 'Speical Nickname',
        iconpath: ImageAssets.specialNicknameIcon,
        color: ColorManager.mybadgeColor),
    ChoiceModel(
        title: 'Edit Profile',
        iconpath: ImageAssets.editProfile1Icon,
        color: ColorManager.helpColor),
  ];
  List choicsRoute = [
    Routes.TopUpViewPageRoute,
    Routes.EarningViewPageRoute,
    Routes.MyTasksViewRoute,
    Routes.VipViewRoute,
    Routes.storeViewPageRoute,
    Routes.MyBagViewRoute,
    Routes.EarningViewPageRoute,
    Routes.MyBadgeViewRoute,
    Routes.HelpSupportViewRoute,
    Routes.EditProfileViewRoute,
    Routes.MyInvitesViewRoute,
    Routes.SettingViewRoute,
  ];
  final PageController _controller = PageController(initialPage: 0);

  int pageno = 0;
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
          "Vip",
          style: getsemiboldStyle(
              color: ColorManager.white, fontSize: AppSize.s16.mv),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            talentShowcase(),
            dotIndicatorWidget(),
            SizedBox(height: 10.0),
            PrivilegedFeatures(),
            Divider(color: ColorManager.grey),
            SizedBox(height: 10.0),
            Text(
              "VIP Privilege",
              style: getboldStyle(color: ColorManager.white, fontSize: 14.mv),
            ),
            Text(
              "VIP Level 0",
              style: getsemiboldStyle(color: ColorManager.hinttextdarkColor),
            ),
            SizedBox(height: 10),
            GridView.builder(
              padding: EdgeInsets.all(5.0),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.9,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return profilegridview(
                    Choics[index],
                    (() => Navigator.pushNamed(context, choicsRoute[index])),
                    index);
              },
            ),
            SizedBox(height: AppSize.s15),
            button(
                text: "BUY NOW",
                color: ColorManager.primary,
                onTap: () {
                  Navigator.pushNamed(context, Routes.homeViewRoute);
                }),
            SizedBox(height: AppSize.s10),
          ],
        ),
      ),
    );
  }

  Widget profilegridview(
      ChoiceModel profiledata, Function()? onTap, int index) {
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
                profiledata.iconpath ?? ImageAssets.userIcon,
                color: index == pageno ? ColorManager.white : ColorManager.grey,
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Container(
            width: 60,
            child: Center(
              child: Text(
                profiledata.title ?? "",
                textAlign: TextAlign.center,
                style: getsemiboldStyle(
                    color: index == pageno
                        ? ColorManager.white
                        : ColorManager.grey,
                    fontSize: 9.mv
                    //AppSize.s10.mv
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget PrivilegedFeatures() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Privileged Features",
            style: getboldStyle(color: ColorManager.white),
          ),
          Row(
            children: [
              Text(
                "View Details",
                style: getsemiboldStyle(color: ColorManager.hinttextdarkColor),
              ),
              SvgPicture.asset(ImageAssets.forwardIcon),
            ],
          ),
        ],
      ),
    );
  }

  Widget button({Function()? onTap, String? text, Color? color}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context) * 0.06, vertical: 10.0),
      child: CustomButton(
          color: color!,
          text: text ?? "",
          style: getboldStyle(
            color: ColorManager.white,
          ),
          onTap: onTap),
    );
  }

  Widget dotIndicatorWidget() {
    return SmoothPageIndicator(
        controller: _controller,
        count: 9,
        effect: ExpandingDotsEffect(
          spacing: 8.0,
          radius: 10.0,
          dotWidth: 10.0,
          dotHeight: 10.0,
          paintStyle: PaintingStyle.fill,
          strokeWidth: 1.5,
          activeDotColor: ColorManager.primary,
        ));
  }

  Widget talentShowcase() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 240.vs,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: _controller,
          onPageChanged: (no) {
            print("page no${no}");
            setState(() {
              pageno = no;
            });
          },
          children: List.generate(
              9,
              ((index) => Container(
                    // height: 200,
                    // width: 200,
                    decoration: BoxDecoration(
                      //  borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(ImageAssets.vipcardImage),
                      ),
                    ),
                  )
              // Stack(
              //       children: [
              //         Container(
              //           width: double.infinity,
              //           child: Image.asset(
              //             AppAssets.videoplayimage,
              //             fit: BoxFit.fill,
              //           ),
              //         ),
              //         Center(
              //           child: Container(
              //             width: 80,
              //             height: 80,
              //             child: Image.asset(AppAssets.videoplayIcon),
              //           ),
              //         ),
              //       ],
              //     )
              )),
        ),
      ),
    );
  }
}
