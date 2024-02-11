import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/index_widget.dart';
import '../resources/index_manager.dart';
import '../resources/list.dart';

class RecomendedTalentView extends StatefulWidget {
  const RecomendedTalentView({Key? key}) : super(key: key);

  @override
  State<RecomendedTalentView> createState() => _RecomendedTalentViewState();
}

class _RecomendedTalentViewState extends State<RecomendedTalentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondarydarkColor,
      body: Column(
        children: [
          SizedBox(height: AppSize.sizeHeight(context) * 0.05),
          recomendedTalentrow(),
          Divider(),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heading(AppStrings.iWeeklyStar),
                  weeklystar(),
                  heading(AppStrings.iNewTalent),
                  newTalent(),
                  heading(AppStrings.iPopular),
                  popular(),
                  SizedBox(height: AppSize.s15),
                  button(
                      text: AppStrings.confirm.toUpperCase(),
                      color: ColorManager.red,
                      onTap: () {
                        Navigator.pushNamed(context, Routes.homeViewRoute);
                      }),
                  SizedBox(height: AppSize.s10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget recomendedTalentrow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppStrings.recommendedTalent,
              style:
                  getsemiboldStyle(color: ColorManager.white, fontSize: 14.mv)),
          InkWell(
            onTap: () => Navigator.pushNamed(context, Routes.homeViewRoute),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.red),
                  borderRadius: BorderRadius.circular(15.0)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
                child: Text(AppStrings.Skip,
                    style: getmediumStyle(
                        color: ColorManager.red, fontSize: AppSize.s12.mv)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget button({Function()? onTap, String? text, Color? color}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context) * 0.02, vertical: 10.0),
      child: CustomButton(
          color: color!,
          text: text ?? "",
          style: getboldStyle(
            color: ColorManager.white,
          ),
          onTap: onTap),
    );
  }

  Widget weeklystar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 15.0,
        children: [
          users(ImageAssets.starUserImage1, ImageAssets.likeImage2,
              "James Olivia"),
          users(ImageAssets.streamUser1Image, ImageAssets.streamUser7Image,
              "Nia Carl"),
          users(ImageAssets.streamUser2Image, ImageAssets.person1, "Henry via"),
          users(ImageAssets.person2, ImageAssets.person3, "Simon will"),
          users(ImageAssets.person4, ImageAssets.person5, "Harry Niler"),
          users(ImageAssets.person6, ImageAssets.person7, "Gram Bell"),
        ],
      ),
    );
  }

  Widget popular() {
    return Container(
      height: 200,
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
                width: 8.0,
              ),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.only(left: index == 0 ? 8.0 : 0.0),
                child: users(Lists.newtalentbg[index],
                    Lists.newtalentprofile[index], Lists.newusername[index]));
          }),
    );
  }

  Widget newTalent() {
    return Container(
      height: 200,
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
                width: 8.0,
              ),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
                padding: EdgeInsets.only(left: index == 0 ? 8.0 : 0.0),
                child: users(Lists.popularbg[index],
                    Lists.popularprofile[index], Lists.popularusername[index]));
          }),
    );
  }

  Widget heading(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      child: Text(text,
          style: getsemiboldStyle(
              color: ColorManager.gradientColor, fontSize: 15.mv)),
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
              height: 200,
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
                        // ImageAssets.starUserImage195
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
                        // "James Olivia"
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
                      SizedBox(height: 20.0),
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
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorManager.red, width: 2.0),
                        image: DecorationImage(
                            // ImageAssets.likeImage20
                            image: AssetImage(profileimage),
                            fit: BoxFit.cover),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  //uploadeIcon
                  InkWell(
                    onTap: () async {
                      // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>const CreateMyProfilePg()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: ColorManager.white, width: 2.0),
                            color: ColorManager.red,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(1.0),
                            child: Icon(
                              Icons.check,
                              size: 14,
                              color: ColorManager.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
