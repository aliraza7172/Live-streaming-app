// ignore_for_file: deprecated_member_use

import 'package:stream_up_live/widgets/custome_wrap_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/presentation/resources/index_manager.dart';

import '../../widgets/index_widget.dart';

class HelpAndSupportModel {
  String? title;
  bool? isTaped;
  HelpAndSupportModel({this.title, this.isTaped});
}

enum ContactInfo { Email, Phone }

class HelpSupportViewPage extends StatefulWidget {
  const HelpSupportViewPage({Key? key}) : super(key: key);

  @override
  State<HelpSupportViewPage> createState() => _HelpSupportViewPageState();
}

class _HelpSupportViewPageState extends State<HelpSupportViewPage> {
  List<HelpAndSupportModel> dayworkOutList = [
    HelpAndSupportModel(title: "Top-Up", isTaped: true),
    HelpAndSupportModel(title: "App Error", isTaped: false),
    HelpAndSupportModel(title: "Suggestion", isTaped: false),
    HelpAndSupportModel(title: "Earning Info", isTaped: false),
    HelpAndSupportModel(title: "Other Info", isTaped: false),
  ];
  int currentTab = 0;
  ContactInfo? _character = ContactInfo.Email;
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
          "Help & Support",
          style: getsemiboldStyle(
              color: ColorManager.white, fontSize: AppSize.s16.mv),
        ),
      ),
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        toggleButton(tex1: "Feedbakck", text2: "My Feedbakck"),
        Align(
          alignment: Alignment.topCenter,
          child: CustomeCheckBoxWrapWidget(
            list: dayworkOutList,
          ),
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choose Your Contact Information",
                style: getsemiboldStyle(
                    color: ColorManager.white, fontSize: AppSize.s16.mv),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Email',
                  style: getmediumStyle(color: ColorManager.white),
                ),
                leading: Radio<ContactInfo>(
                  fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return ColorManager.hinttextdarkColor;
                    }
                    return ColorManager.primary;
                  }),
                  value: ContactInfo.Email,
                  groupValue: _character,
                  onChanged: (ContactInfo? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Phone',
                  style: getmediumStyle(color: ColorManager.white),
                ),
                leading: Radio<ContactInfo>(
                  value: ContactInfo.Phone,
                  groupValue: _character,
                  fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return ColorManager.hinttextdarkColor;
                    }
                    return ColorManager.primary;
                  }),
                  onChanged: (ContactInfo? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
              CustomeTextFormField(
                horizontalMergin: 0.0,
                hintText: "Email Address",
                fillColor: ColorManager.primarydarkdarkColor,
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return AppStrings.enterEmailAddress;
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              CustomeTextFormField(
                horizontalMergin: 0.0,
                hintText: "Issues Details",
                fillColor: ColorManager.primarydarkdarkColor,
                maxLines: 5,
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return AppStrings.enterEmailAddress;
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              Text(
                "Upload Picture/Video",
                style: getsemiboldStyle(
                    color: ColorManager.white, fontSize: AppSize.s16.mv),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                child: Container(
                  height: 200,
                  width: AppSize.sizeWidth(context),
                  decoration: BoxDecoration(
                      color: ColorManager.primarydarkdarkColor,
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 3.0, horizontal: 10.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: ColorManager.primarydarkdarkColor
                                  .withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child:
                                  SvgPicture.asset(ImageAssets.picCameraIcon),
                              // Image(
                              //   image: AssetImage(ImageAssets.cameraIcon),
                              //   fit: BoxFit.contain,
                              // ),
                            ),
                          ),
                          Text(
                            "Upload Photo",
                            style: getsemiboldStyle(
                                color: ColorManager.white, fontSize: 8.mv),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        button(text: "SUBMIT NOW", color: ColorManager.primary, onTap: () {}),
        SizedBox(height: 10),
      ])),
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
            fontSize: AppSize.s12.mv,
          ),
          onTap: onTap),
    );
  }

  Widget toggleButton({String? tex1, String? text2}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Expanded(
              child: GestureDetector(
            onTap: (() {
              setState(() {
                currentTab = 0;
              });
            }),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: currentTab == 0
                      ? ColorManager.primary
                      : ColorManager.primarydarkColor),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  tex1!.toUpperCase(),
                  style: getmediumStyle(color: ColorManager.white),
                ),
              )),
            ),
          )),
          const SizedBox(width: 10.0),
          Expanded(
              child: GestureDetector(
            onTap: (() {
              setState(() {
                currentTab = 1;
              });
            }),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: currentTab == 1
                      ? ColorManager.primary
                      : ColorManager.primarydarkColor),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text2!.toUpperCase(),
                  style: getmediumStyle(color: ColorManager.white),
                ),
              )),
            ),
          )),
        ],
      ),
    );
  }
}
