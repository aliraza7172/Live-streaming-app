// ignore_for_file: deprecated_member_use

import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../widgets/index_widget.dart';
import '../resources/index_manager.dart';

class SignUpWithNumberView extends StatefulWidget {
  const SignUpWithNumberView({Key? key}) : super(key: key);

  @override
  State<SignUpWithNumberView> createState() => _SignUpWithNumberViewState();
}
//CustomSnacksBar.showSnackBar(context, "Process..");

class _SignUpWithNumberViewState extends State<SignUpWithNumberView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: AppSize.s70.vs),
                AppLogoView(),
                SizedBox(height: AppSize.s10.vs),
                Text(
                  AppStrings.enterYourPhoneNumber,
                  style: getmediumStyle(
                      color: ColorManager.white, fontSize: AppSize.s12.mv),
                ),
                SizedBox(height: 40.vs),
                selectCountryField(),
                SizedBox(height: 20.vs),
                button(
                    text: AppStrings.next,
                    color: ColorManager.primary,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, Routes.verifiedCodeRoute);
                      }
                    }),
                SizedBox(height: 1.vs),
                ortext(),
                facebookGoogleBtn(
                  onFacebookTab: () {},
                  // => Navigator.pushNamed(
                  //     context, Routes.signUpWithNumberRoute),
                  onGoogleTab: () {},
                  //  => Navigator.pushNamed(
                  //     context, Routes.signUpWithEmailRoute)
                ),
                SizedBox(height: 4.vs),
                textspan(
                    text1: AppStrings.alreadyHaveAnAccount,
                    text2: AppStrings.signIn,
                    onTap: () => Navigator.pushReplacementNamed(
                        context, Routes.loginRoute),
                    context: context),
                SizedBox(height: 1.vs)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget ortext() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              height: 1.0,
              // width: 28.0.w,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "OR",
              style: getsemiboldStyle(
                color: ColorManager.white,
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: 1.0,
              // width: 28.0.w,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget facebookGoogleBtn(
      {Function()? onFacebookTab, Function()? onGoogleTab}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onFacebookTab,
            child: Container(
              height: AppSize.s50,
              width: AppSize.s50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.lightblue,
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p14),
                child: SvgPicture.asset(
                  ImageAssets.facebookIcon,
                  color: ColorManager.white,
                ),
              ),
            ),
          ),
          SizedBox(width: AppSize.s15.hs),
          InkWell(
              onTap: onGoogleTab,
              child: Container(
                height: AppSize.s50,
                width: AppSize.s50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.red,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p14),
                  child: SvgPicture.asset(
                    ImageAssets.googleIcon,
                    color: ColorManager.white,
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget selectCountryField() {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: AppSize.sizeWidth(context) * 0.07),
      child: IntlPhoneField(
        decoration: InputDecoration(
          hintStyle:
              TextStyle(color: ColorManager.hinttextdarkColor, fontSize: 12.mv),
          hintText: AppStrings.phoneNumber,
          contentPadding: const EdgeInsets.fromLTRB(14, 14.0, 14.0, 14.0),
          filled: true,
          fillColor: ColorManager.primarydarkColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: ColorManager.grey, width: 1.5)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                  color: ColorManager.blackBorder.withOpacity(0.2),
                  width: 1.5)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: ColorManager.primary, width: 1.5)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: ColorManager.red, width: 1.5)),
        ),
        initialCountryCode: 'US',
        onChanged: (phone) {
          print(phone.completeNumber);
        },
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
}

Widget textspan(
    {String? text1, String? text2, BuildContext? context, Function()? onTap}) {
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
                  color: ColorManager.red,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeightManager.semibold,
                  fontSize: AppSize.s12.mv),
              recognizer: TapGestureRecognizer()..onTap = onTap)
        ],
      ),
    ),
  );
}
