// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stream_up_live/controller/auth_controller.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stream_up_live/presentation/RecomendedTalents/recomended_talents_screen.dart';
import 'package:stream_up_live/widgets/custom_snackbar.dart';

import '../../widgets/index_widget.dart';
import '../resources/index_manager.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool rememberMe = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (_) {
          return BackgroundImage(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: AppSize.s50.vs),
                      AppLogoView(),
                      Text(
                        AppStrings.signUp,
                        style: getmediumStyle(
                            color: ColorManager.white,
                            fontSize: AppSize.s20.mv),
                      ),
                      SizedBox(height: AppSize.s10.vs),
                      Text(
                        AppStrings.createAnAccountText,
                        style: getmediumStyle(
                            color: ColorManager.white,
                            fontSize: AppSize.s12.mv),
                      ),
                      SizedBox(height: AppSize.s20.vs),
                      CustomeTextFormField(
                        hintText: AppStrings.enterYourName,
                        controller: _nameController,
                        fillColor: ColorManager.primarydarkColor,
                        validator: (String? val) {
                          if (val == null || val.isEmpty) {
                            return AppStrings.enterEmailAddress;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: AppSize.s20.vs),
                      CustomeTextFormField(
                        hintText: AppStrings.enterYourEmailAddress,
                        controller: _emailController,
                        fillColor: ColorManager.primarydarkColor,
                        validator: (String? val) {
                          if (val == null || val.isEmpty) {
                            return AppStrings.enterEmailAddress;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: AppSize.s20.vs),
                      CustomeTextFormField(
                        hintText: AppStrings.enterYourPhoneNumber,
                        controller: _numberController,
                        keyboardType: TextInputType.number,
                        fillColor: ColorManager.primarydarkColor,
                        validator: (String? val) {
                          if (val == null || val.isEmpty) {
                            return AppStrings.enterEmailAddress;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: AppSize.s20.vs),
                      CustomeTextFormField(
                        obscureText: true,
                        hintText: AppStrings.enterYourPassword,
                        controller: _passwordController,
                        fillColor: ColorManager.primarydarkColor,
                        onSubmitted: (text) {
                          String _email = _emailController.text.trim();
                          String _password = _passwordController.text.trim();
                          String _name = _nameController.text.trim();
                          String _number = _numberController.text.trim();
                          _signup(_, _email, _password, _name, _number);
                        },
                        validator: (String? val) {
                          if (val == null || val.isEmpty) {
                            return AppStrings.enterEmailAddress;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 1.vs),
                      TermAndCondition(),
                      SizedBox(height: 1.vs),
                      button(
                          text: AppStrings.createAnAccount,
                          color: ColorManager.primary,
                          loader: _.isLoading,
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            String _email = _emailController.text.trim();
                            String _password = _passwordController.text.trim();
                            String _name = _nameController.text.trim();
                            String _number = _numberController.text.trim();
                            _signup(_, _email, _password, _name, _number);
                          }),
                      SizedBox(height: 1.vs),
                      // ortext(),
                      // SizedBox(height: 1.vs),
                      // facebookGoogleBtn(
                      //   onFacebookTab: () {
                      //     print("=============");
                      //     signUpWithFacebook();
                      //   },
                      //   // => Navigator.pushNamed(
                      //   //     context, Routes.signUpWithNumberRoute),
                      //   onGoogleTab: () async {
                      //     UserCredential?  userCredential=await signUpWithGoogle();
                      //     if(userCredential!=null) {
                      //       final String? _name = userCredential.user!.displayName;
                      //       final String? _email = userCredential.user!.email;
                      //       final String? _password = userCredential.user!.uid;
                      //       final String? _number = userCredential.user!.phoneNumber;
                      //       _signup(_,_email,_password,_name,_number.toString());
                      //     } },
                      // ),
                      SizedBox(height: 4.vs),
                      textspan(
                        text1: AppStrings.dontHaveAnAccount,
                        text2: AppStrings.loginFC,
                        onTap: () => Navigator.pushReplacementNamed(
                            context, Routes.loginRoute),
                      ),
                      SizedBox(height: 1.vs)
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget TermAndCondition() {
    return Padding(
      padding: EdgeInsets.only(left: AppSize.sizeWidth(context) * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 40.0,
            width: 40.0,
            child: Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: rememberMe,
              activeColor: ColorManager.primary,
              focusColor: ColorManager.white,
              onChanged: (value) => setState(
                () => rememberMe = value!,
              ),
            ),
          ),
          RichText(
            text: TextSpan(
              text: "I agree with your Privacy Policy and",
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
              children: <TextSpan>[
                TextSpan(
                  text: " Term and Condition",
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //     builder: (BuildContext context) =>
                      //     const LoginScreen(),
                      //   ),
                      // );
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Please Accept Terms and conditions")));
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
    //SizedBox(height: 10.0),
  }

  Widget button({Function()? onTap, String? text, Color? color, loader}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context) * 0.06, vertical: 10.0),
      child: CustomButton(
          isLoader: loader,
          color: color!,
          text: text ?? "",
          style: getboldStyle(
            color: ColorManager.white,
            fontSize: AppSize.s12.mv,
          ),
          onTap: onTap),
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
      child: Column(
        children: [
          InkWell(
            onTap: onGoogleTab,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: AppSize.sizeWidth(context) * 0.06,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppPadding.p5),
                color: ColorManager.googlebtn,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p14),
                    child: SvgPicture.asset(
                      ImageAssets.googleIcon,
                      color: ColorManager.white,
                    ),
                  ),
                  Text(
                    "Sign Up with Google",
                    style: getmediumStyle(
                      color: ColorManager.white,
                      fontSize: AppSize.s14.mv,
                    ),
                  )
                ],
              ),
            ),
          ),
          // SizedBox(height: AppPadding.p20,),
          // InkWell(
          //   onTap: onFacebookTab,
          //   child: Container(
          //     width: double.infinity,
          //     margin:EdgeInsets.symmetric(
          //       horizontal: AppSize.sizeWidth(context) * 0.06,),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(AppPadding.p5),
          //       color: ColorManager.fbbtn,
          //     ),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.all(AppPadding.p14),
          //           child: SvgPicture.asset(
          //             ImageAssets.facebookIcon,
          //             color: ColorManager.white,
          //           ),
          //         ),
          //         Text("Sign Up with facebook",style: getmediumStyle(
          //           color: ColorManager.white,
          //           fontSize: AppSize.s14.mv,
          //         ),)
          //       ],
          //     ),
          //   ),
          // ),
        ],
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

  void _signup(AuthController authController, _email, _password, _name,
      String _number) async {
    // String _email = _emailController.text.trim();
    // String _password = _passwordController.text.trim();
    // String _name = _nameController.text.trim();
    // String _number = _numberController.text.trim();
    if (_email.isEmpty) {
      showCustomSnackBar('enter_email_address'.tr);
    } else if (!GetUtils.isEmail(_email)) {
      showCustomSnackBar('enter_a_valid_email_address'.tr);
    } else if (_password.isEmpty) {
      showCustomSnackBar('enter_password'.tr);
    } else if (_name.isEmpty) {
      showCustomSnackBar('enter_name'.tr);
    } else if (_number.isEmpty) {
      showCustomSnackBar('enter_number'.tr);
    } else if (!rememberMe) {
      showCustomSnackBar('accept_terms and condition'.tr);
    }
    // else if (_password.length < 9) {
    //   showCustomSnackBar('password_should_be '.tr);
    // }
    else {
      authController
          .signup(_email, _password, _name, _number)
          .then((status) async {
        if (status.isSuccess) {
          await authController.login(_email, _password).then((status) async {
            if (status.isSuccess) {
              Get.offAll(() => RecomendedTalentView());
            } else {
              Navigator.pushNamed(context, Routes.loginRoute);
              showCustomSnackBar(status.message);
            }
          });
        } else {
          showCustomSnackBar(status.message);
        }
      });
    }
  }

  Future<UserCredential?> signUpWithGoogle() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      // Extract user information
      // final String? userName = userCredential.user!.displayName;
      // final String? userEmail = userCredential.user!.email;
      // final String? userId = userCredential.user!.uid;
      // final String? number = userCredential.user!.phoneNumber;
      // people.PeopleServiceApi peopleApi = people.PeopleServiceApi(httpClient);
      // people.Person me = await peopleApi.people.get(
      //   'people/me',
      //   personFields: 'phoneNumbers',
      //   // access_token: accessToken,
      // );
      // String? phoneNumber = me.phoneNumbers?.first.value;

      return userCredential;
      // Send user information to Laravel API
    } catch (e) {
      print('Error signing up with Google: $e');
      return null;
    }
  }

  Future<void> signUpWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      final AccessToken accessToken = result.accessToken!;
      final userData = await FacebookAuth.instance.getUserData();

      // Extract user information
      final String? userName = userData['name'];
      final String? userEmail = userData['email'];
      final String? userId = accessToken.userId;
      print(
          "========userEmail:$userEmail===userName:$userName=====userId:$userId=====");
      // Send user information to your backend or API
    } catch (e) {
      print('Error signing up with Facebook: $e');
    }
  }
}
