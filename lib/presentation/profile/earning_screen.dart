// ignore_for_file: deprecated_member_use

import 'package:stream_up_live/widgets/index_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/presentation/resources/index_manager.dart';

class EarningViewPage extends StatefulWidget {
  const EarningViewPage({Key? key}) : super(key: key);

  @override
  State<EarningViewPage> createState() => _EarningViewPageState();
}

class _EarningViewPageState extends State<EarningViewPage> {
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
          "Offical Talent",
          style: getsemiboldStyle(
              color: ColorManager.white, fontSize: AppSize.s16.mv),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: AppSize.sizeWidth(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heading("Official Talent Requirements"),
                acceptanceOfTerms(text: AppStrings.loremipsum3lines),
                heading("OR"),
                acceptanceOfTerms(text: AppStrings.loremipsum3lines),
                heading("What Should you become an official talent"),
                acceptanceOfTerms(text: AppStrings.loremipsum3lines),
                acceptanceOfTerms(text: AppStrings.loremipsum),
                acceptanceOfTerms(text: AppStrings.loremipsum3lines),
                acceptanceOfTerms(text: AppStrings.loremipsum3lines),
                heading("Note"),
                Text(
                  AppStrings.loremipsum3lines + AppStrings.loremipsum3lines,
                  style: TextStyle(
                    fontSize: 14,
                    wordSpacing: 5.0,
                    color: ColorManager.primary,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Divider(color: ColorManager.grey)),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Current Gem Balance: 0 germs",
                    style: TextStyle(
                      fontSize: 14,
                      wordSpacing: 5.0,
                      color: ColorManager.hinttextdarkColor,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Gems Requrired to Apply: 200000 gems",
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorManager.hinttextdarkColor,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                button(
                    text: "CANNOT APPLY",
                    color: ColorManager.primarydarkdarkColor,
                    onTap: () {
                      // Navigator.pushNamed(context, Routes.homeViewRoute);
                    }),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "I have an agency ID",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 14.mv,
                      color: ColorManager.hinttextdarkColor,
                    ),
                  ),
                ),
                SizedBox(height: AppSize.s10),
              ],
            ),
          ),
        ),
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

  Widget heading(String heading) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        heading,
        style: TextStyle(
            fontSize: 18,
            color: ColorManager.white,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget acceptanceOfTerms({String? text}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 10.0, top: 5.0),
      child: Row(
        children: [
          Container(
            height: 10,
            width: 10,
            decoration: BoxDecoration(
              color: ColorManager.primary,
              //borderRadius: BorderRadius.circular(5.0),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 10.0),
          Flexible(
            child: Text(
              text!,
              //"Lorem ipsum dolor sit amet, ",
              style: TextStyle(
                fontSize: 14,
                color: ColorManager.hinttextdarkColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
