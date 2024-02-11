// ignore_for_file: deprecated_member_use

import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/presentation/resources/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String? language;
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
          "Language",
          style: getsemiboldStyle(
              color: ColorManager.white, fontSize: AppSize.s16.mv),
        ),
      ),
      body: ListView.separated(
        itemCount: Lists.language.length,
        separatorBuilder: (context, index) => Divider(
          color: ColorManager.grey,
        ),
        itemBuilder: (context, index) => CustomRadio(
          title: Lists.language[index],
          // onTap: () {
          //   Navigator.pushNamed(context, choicsRoute[index]);
          // },
        ),
      ),

      // RadioListTile(
      //   activeColor: ColorManager.red,

      //   title: Text("Male",
      //       style: getRegularStyle(
      //           color: ColorManager.whiteColor, fontSize: 16.mv)),
      //   value: "male",
      //   groupValue: gender,
      //   onChanged: (value) {
      //     setState(() {
      //       gender = value.toString();
      //     });
      //   },
      // ),
    );
  }

  Widget CustomRadio({String? title}) {
    return RadioListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
      activeColor: ColorManager.red,
      title: Transform.translate(
        offset: Offset(-15, 0),
        child: Text(title!,
            style: getRegularStyle(
                color: ColorManager.whiteColor, fontSize: 16.mv)),
      ),
      value: title,
      groupValue: language,
      onChanged: (value) {
        setState(() {
          language = value.toString();
        });
      },
    );
  }
}