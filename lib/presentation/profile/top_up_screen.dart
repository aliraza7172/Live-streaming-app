// ignore_for_file: deprecated_member_use

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/presentation/resources/index_manager.dart';

class SelectAccountModel {
  String? IconPath;
  String? title;
  SelectAccountModel(this.IconPath, this.title);
}

class TopUpViewPage extends StatefulWidget {
  const TopUpViewPage({Key? key}) : super(key: key);

  @override
  State<TopUpViewPage> createState() => _TopUpViewPageState();
}

class _TopUpViewPageState extends State<TopUpViewPage> {
  List<SelectAccountModel> SelectAccountList = [
    SelectAccountModel(ImageAssets.easypaisaIcon, "Easypaisa"),
    SelectAccountModel(ImageAssets.paypalIcon, "Paypal"),
    SelectAccountModel(ImageAssets.googlepayIcon, "Google"),
    SelectAccountModel(ImageAssets.topUptextIcon, "Topup Agent"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondarydarkColor,
      appBar: AppBar(
        backgroundColor: ColorManager.primarydarkdarkColor,
        centerTitle: false,
        titleSpacing: 0,
        elevation: 0.0,
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
          "Topup",
          style: getsemiboldStyle(
              color: ColorManager.white, fontSize: AppSize.s16.mv),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: ColorManager.primarydarkdarkColor,
            height: 150,
            width: AppSize.sizeWidth(context),
            child: Center(
              child: Column(
                children: [
                  SvgPicture.asset(
                    ImageAssets.beansIcon,
                    height: 50,
                    width: 50,
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Avaiable Beans : 1200",
                    style: getsemiboldStyle(color: ColorManager.white),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5.0),
          account(),
          SizedBox(
            height: 280,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ListView.separated(
                itemCount: SelectAccountList.length,
                separatorBuilder: (context, index) => Divider(
                  color: ColorManager.grey,
                ),
                itemBuilder: (context, index) => customeListTile(
                    SelectAccountList[index].IconPath,
                    SelectAccountList[index].title),
              ),
            ),
          ),
          Divider(),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Note: ",
              style: getsemiboldStyle(color: ColorManager.whiteColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  "1. ",
                  style: getsemiboldStyle(color: ColorManager.whiteColor),
                ),
                textspan(
                    text1: AppStrings.toSolve,
                    text2: AppStrings.fedback,
                    onTap: () {}),
              ],
            ),
          ),
          // Spacer(),
          //customeListTile()
          // ListTile(
          //   leading: SvgPicture.asset(
          //     ImageAssets.easypaisaIcon,
          //   ),
          //   title: Text("Easypaisa"),
          //   trailing: SvgPicture.asset(ImageAssets.forwardIcon),
          // ),
        ],
      ),
    );
  }

  Widget customeListTile(String? IconPath, String? title) {
    return ListTile(
      leading: SvgPicture.asset(IconPath!),
      title: Text(title ?? "",
          style: getsemiboldStyle(
              color: ColorManager.hinttextdarkColor, fontSize: 14.mv)),
      trailing: SvgPicture.asset(ImageAssets.forwardIcon),
    );
  }

  Widget account() {
    return Container(
      color: ColorManager.primarydarkdarkColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Account ID : ",
                  style:
                      getsemiboldStyle(color: ColorManager.hinttextdarkColor),
                ),
                Text(
                  "johnsmith77",
                  style: getsemiboldStyle(color: ColorManager.white),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Gift To Friend ",
                  style: getsemiboldStyle(color: ColorManager.white),
                ),
                SvgPicture.asset(
                  ImageAssets.forwardIcon,
                  color: ColorManager.white,
                  height: 15,
                  width: 15,
                ),
                SizedBox(
                  width: 10.0,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget textspan(
      {String? text1,
      String? text2,
      BuildContext? context,
      Function()? onTap}) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p14, vertical: AppPadding.p20),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: text1,
          style: getRegularStyle(
              color: ColorManager.white, fontSize: AppSize.s12.mv),
          children: <TextSpan>[
            TextSpan(
                text: text2,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: ColorManager.primary,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeightManager.semibold,
                    fontSize: AppSize.s12.mv),
                recognizer: TapGestureRecognizer()..onTap = onTap)
          ],
        ),
      ),
    );
  }
}
