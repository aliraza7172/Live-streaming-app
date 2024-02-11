import 'dart:async';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:stream_up_live/controller/auth_controller.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:stream_up_live/widgets/custom_snackbar.dart';
import 'package:stream_up_live/widgets/singlevalue_textfield.dart';

import '../../widgets/index_widget.dart';
import '../resources/index_manager.dart';

class OtpVerificationView extends StatefulWidget {
  const OtpVerificationView({Key? key}) : super(key: key);

  @override
  State<OtpVerificationView> createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
  TextEditingController otp = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  bool hasError = false;
  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();

    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    //viewmodel.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BackgroundImage(
        child: GetBuilder<AuthController>(
          init: AuthController(),
          builder: (_) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: AppSize.s50.vs),
                    AppLogoView(),
                    SizedBox(height: AppSize.s10.vs),
                    Text(
                      AppStrings.confirmationCode,
                      textAlign: TextAlign.center,
                      style: getboldStyle(
                          color: ColorManager.white, fontSize: AppSize.s20.mv),
                    ),
                    SizedBox(height: AppSize.s10.vs),
                    Text(
                      AppStrings.digitCode,
                      textAlign: TextAlign.center,
                      style: getmediumStyle(
                          color: ColorManager.white, fontSize: AppSize.s16.mv),
                    ),
                    SizedBox(height: AppSize.sizeHeight(context) * 0.04),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: List.generate(
                    //     6,
                    //     (index) {
                    //       return Container(
                    //         decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(8),
                    //           color: Color.fromRGBO(48, 55, 73, 1),
                    //         ),
                    //         padding: EdgeInsets.all(11),
                    //         child: PinCodeTextField(
                    //           appContext: context,
                    //           hintCharacter: '',
                    //           pastedTextStyle:
                    //               getRegularStyle(color: ColorManager.grey),
                    //           length: 1,
                    //           blinkWhenObscuring: true,
                    //           animationType: AnimationType.fade,
                    //           validator: (v) {
                    //             if (v!.length <= 5) {
                    //               hasError = true;
                    //             } else {
                    //               hasError = false;
                    //             }
                    //             return null;
                    //           },
                    //           pinTheme: PinTheme(
                    //             shape: PinCodeFieldShape.box,
                    //             borderRadius: BorderRadius.circular(5),
                    //
                    //             selectedFillColor: ColorManager.kColorDarkestGrey,
                    //             selectedColor: ColorManager.kColorDarkGrey,
                    //             activeColor: ColorManager.kColorDarkGrey,
                    //             inactiveColor: ColorManager.kColorDarkGrey,
                    //             activeFillColor: ColorManager.kColorDarkestGrey,
                    //             // fieldWidth: 40,
                    //             fieldOuterPadding:
                    //                 EdgeInsets.symmetric(horizontal: 12.0),
                    //           ),
                    //           //cursorColor: Colors.black,
                    //           animationDuration: const Duration(milliseconds: 300),
                    //           // enableActiveFill: true,
                    //           cursorColor: ColorManager.red,
                    //           errorAnimationController: errorController,
                    //           controller: textEditingController,
                    //           textStyle: TextStyle(color: ColorManager.white),
                    //           //scrollPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    //           keyboardType: TextInputType.number,
                    //           onCompleted: (v) {},
                    //           onChanged: (value) {
                    //             setState(() {
                    //               currentText = value;
                    //             });
                    //           },
                    //           beforeTextPaste: (text) {
                    //             //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //             //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    //             return true;
                    //           },
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),

                    // Container(
                    //   child: PinCodeTextField(
                    //     appContext: context,
                    //     hintCharacter: '',
                    //     pastedTextStyle:
                    //         getRegularStyle(color: ColorManager.grey),
                    //     length: 6,
                    //
                    //     blinkWhenObscuring: true,
                    //     animationType: AnimationType.fade,
                    //     validator: (v) {
                    //       if (v!.length <= 5) {
                    //         hasError = true;
                    //       } else {
                    //         hasError = false;
                    //       }
                    //       return null;
                    //     },
                    //     pinTheme: PinTheme(
                    //       shape: PinCodeFieldShape.box,
                    //       borderRadius: BorderRadius.circular(5),
                    //
                    //       selectedFillColor: ColorManager.kColorDarkestGrey,
                    //       selectedColor: ColorManager.kColorDarkGrey,
                    //       activeColor: ColorManager.kColorDarkGrey,
                    //       inactiveColor: ColorManager.kColorDarkGrey,
                    //       activeFillColor: ColorManager.kColorDarkestGrey,
                    //       // fieldWidth: 40,
                    //       fieldOuterPadding:
                    //           EdgeInsets.symmetric(horizontal: 8.0),
                    //     ),
                    //     //cursorColor: Colors.black,
                    //     animationDuration: const Duration(milliseconds: 300),
                    //     // enableActiveFill: true,
                    //     cursorColor: ColorManager.red,
                    //     errorAnimationController: errorController,
                    //     controller: otp,
                    //     textStyle: TextStyle(color: ColorManager.white),
                    //     //scrollPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    //     keyboardType: TextInputType.number,
                    //     onCompleted: (v) {
                    //       _validateCode(_);
                    //     },
                    //     onChanged: (value) {},
                    //     beforeTextPaste: (text) {
                    //       //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //       //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    //       return true;
                    //     },
                    //   ),
                    // ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:10.vs ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SingleTextField(
                            focusNode: _.f1,
                            controller: _.v1,
                            onChanged: (String newVal) {
                              if (newVal.length == 1) {
                                _.f2.requestFocus();
                              }
                            },
                            onSubmitted: (String newVal) {
                              if (newVal.length == 1) {
                                _.f2.requestFocus();
                              }
                            },
                          ),
                          SingleTextField(
                            focusNode: _.f2,
                            controller: _.v2,
                            onChanged: (String newVal) {
                              if (newVal.length == 1) {
                                _.f3.requestFocus();
                              }
                            },
                            onSubmitted: (String newVal) {
                              if (newVal.length == 1) {
                                _.f3.requestFocus();
                              }
                            },
                          ),
                          SingleTextField(
                            focusNode: _.f3,
                            controller: _.v3,
                            onChanged: (String newVal) {
                              if (newVal.length == 1) {
                                _.f4.requestFocus();
                              }
                            },
                            onSubmitted: (String newVal) {
                              if (newVal.length == 1) {
                                _.f4.requestFocus();
                              }
                            },
                          ),
                          SingleTextField(
                            focusNode: _.f4,
                            controller: _.v4,
                            onChanged: (String newVal) {
                              if (newVal.length == 1) {
                                _.f5.requestFocus();
                              }
                            },
                            onSubmitted: (String newVal) {
                              if (newVal.length == 1) {
                                _.f5.requestFocus();
                              }
                            },
                          ),
                          SingleTextField(
                            focusNode: _.f5,
                            controller: _.v5,
                            onChanged: (String newVal) {
                              if (newVal.length == 1) {
                                _.f6.requestFocus();
                              }
                            },
                            onSubmitted: (String newVal) {
                              if (newVal.length == 1) {
                                _.f6.requestFocus();
                              }
                            },
                          ),
                          SingleTextField(
                            focusNode: _.f6,
                            controller: _.v6,
                            onChanged: (String newVal) {
                              if (newVal.length == 1) {
                                _.f6.unfocus();
                                // f2.requestFocus();
                              }
                            },
                            onSubmitted: (text){
                              _validateCode(_);
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4.vs),
                    button(
                        text: AppStrings.continueText,
                        color: ColorManager.red,
                        loader: _.isLoading,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          _validateCode(_);
                          // if (currentText.length == 6) {
                          //   Navigator.pushNamed(
                          //       context, Routes.createpasswordRoute);
                          // } else {
                          //   // CustomSnacksBar.showSnackBar(
                          //   //     context, AppConstant.otpValidator);
                          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //     content: Text(AppStrings.otpValidator),
                          //     duration: Duration(milliseconds: 1000),
                          //   ));
                        }),
                    SizedBox(height: 2.vs),
                    textspan(
                        text1: AppStrings.dontReceiveCodeResend,
                        text2: AppStrings.Resend,
                        onTap: () {},
                        //Navigator.pushNamed(context, Routes.loginRoute),
                        context: context),
                    // Padding(
                    //   padding:
                    //       EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.0),
                    //   child: CustomeButton(
                    //       text: AppConstant.next,
                    //       onTap: () {
                    //         if (currentText.length == 6) {
                    //           AppNavigation.navigateTo(context, '/CreatePassword');
                    //         } else {
                    //           // CustomSnacksBar.showSnackBar(
                    //           //     context, AppConstant.otpValidator);
                    //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //             content: Text(AppConstant.otpValidator),
                    //             duration: Duration(milliseconds: 1000),
                    //           ));
                    //         }
                    //       }),
                    // ),
                  ],
                ),
              ),
            );
          },
        ),
      );
  Widget button({Function()? onTap, String? text, Color? color, loader}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context) * 0.06, vertical: 10.0),
      child: CustomButton(
          isLoader: loader,
          color: color!,
          text: text ?? "",
          style: getboldStyle(color: ColorManager.white),
          onTap: onTap),
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
          style: getmediumStyle(
              color: ColorManager.whiteColor, fontSize: AppSize.s12.mv),
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

  void _validateCode(AuthController authController) async {
    String _otp = authController.v1.text.trim()+authController.v2.text.trim()+authController.v3.text.trim()+authController.v4.text.trim()+authController.v5.text.trim()+authController.v6.text.trim();
    if (_otp.isEmpty) {
      showCustomSnackBar('enter_code'.tr);
    } else if (_otp.length < 6) {
      showCustomSnackBar('coe_must_be_6_digit'.tr);
    } else {
      authController
          .validateCode(
        _otp,
      )
          .then((status) async {
        if (status.isSuccess) {
          debugPrint(
              "=======status${status.isSuccess}:${status.message}=======");
          Navigator.pushNamed(context, Routes.createpasswordRoute);
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
