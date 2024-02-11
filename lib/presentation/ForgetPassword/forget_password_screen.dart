// ignore_for_file: deprecated_member_use

import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:stream_up_live/controller/auth_controller.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/presentation/login/login_screen.dart';
import 'package:stream_up_live/widgets/custom_snackbar.dart';
import 'package:stream_up_live/widgets/index_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/index_manager.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
        builder: (_){
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
                  Text(
                    AppStrings.forgotPassword,
                    style: getmediumStyle(
                        color: ColorManager.white, fontSize: AppSize.s16.mv),
                  ),
                  SizedBox(height: AppSize.s20.vs),
                  Text(
                    AppStrings.enterYourEmailAddress,
                    style: getmediumStyle(
                        color: ColorManager.white, fontSize: AppSize.s12.mv),
                  ),
                  SizedBox(height: AppSize.s30.vs),
                  CustomeTextFormField(
                    hintText: AppStrings.yourEmailAddress,
                    controller: _emailController,
                    fillColor: ColorManager.primarydarkColor,
                    validator: (String? val) {
                      if (val == null || val.isEmpty) {
                        return AppStrings.enterEmailAddress;
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.vs),
                  button(
                      text: AppStrings.continueText,
                      loader: _.isLoading,
                      color: ColorManager.red,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();
                          _sendCode(_);
                        }
                      }),
                  // SizedBox(height: 1.vs),
                  // ortext(),
                  // facebookGoogleBtn(
                  //   onFacebookTab: () {},
                  //   // => Navigator.pushNamed(
                  //   //     context, Routes.signUpWithNumberRoute),
                  //   onGoogleTab: () {},
                  //   //  => Navigator.pushNamed(
                  //   //     context, Routes.signUpWithEmailRoute)
                  // ),
                  SizedBox(height: 4.vs),
                  textspan(
                      text1: AppStrings.alreadyHaveAnAccount,
                      text2: AppStrings.signIn,
                      onTap: () =>Get.offAll(()=>LoginView()),
                          // Navigator.pushReplacementNamed(context, Routes.loginRoute),
                      context: context),
                  SizedBox(height: 1.vs)
                ],
              ),
            ),
          ),
        ),
      );
    });
  }


  Widget button({Function()? onTap, String? text, Color? color,loader}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context) * 0.06, vertical: 10.0),
      child: CustomButton(
          color: color!,
          isLoader: loader,
          text: text ?? "",
          style: getboldStyle(
            color: ColorManager.white,
          ),
          onTap: onTap),
    );
  }
  void _sendCode(AuthController authController) async {
    String _email = _emailController.text.trim();
    if (_email.isEmpty) {
      showCustomSnackBar('enter_email_address'.tr);
    } else if (!GetUtils.isEmail(_email)) {
      showCustomSnackBar('enter_a_valid_email_address'.tr);
    }
    else {
      authController.sendCode(_email,).then((status) async {
        if (status.isSuccess) {
          debugPrint("=======status${status.isSuccess}:${status.message}=======");

          Navigator.pushNamed(context, Routes.verifiedCodeRoute);
          // Navigator.pushNamedAndRemoveUntil(context, Routes.homeViewRoute, (route) => false);
        } else {
          debugPrint(
              "=======status${status.isSuccess}:${status.message}=======");
          showCustomSnackBar(status.message);
        }
      });
    }
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
