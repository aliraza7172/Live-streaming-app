// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:video_player/video_player.dart';

import 'package:stream_up_live/controller/auth_controller.dart';
import 'package:stream_up_live/presentation/Home/home_screen.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/presentation/RecomendedTalents/recomended_talents_screen.dart';
import 'package:stream_up_live/widgets/custom_snackbar.dart';
import 'package:stream_up_live/widgets/loader.dart';

import '../resources/index_manager.dart';

class LoginWithSocialMediaView extends StatefulWidget {
  const LoginWithSocialMediaView({Key? key}) : super(key: key);
  @override
  State<LoginWithSocialMediaView> createState() =>
      _LoginWithSocialMediaViewState();
}

class _LoginWithSocialMediaViewState extends State<LoginWithSocialMediaView> {
  bool rememberMe = false;
  bool showButtons = false;
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // _controller =
    //     VideoPlayerController.asset(ImageAssets.loginSocialMediaDarkVideo);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (_) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Stack(
                children: <Widget>[
                  _getVideoBackground(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: AppSize.s90.vs),

                      // Image.asset(
                      //   height: 250,
                      //   ImageAssets.applogo,
                      // ),
                      // SizedBox(height: AppSize.s12),
                      Container(
                        child: Column(
                          children: [
                            Text(
                              'YAMMY',
                              style: getsemiboldStyle(
                                  color: ColorManager.white,
                                  fontSize: AppSize.s30.mv),
                            ),
                            Text(
                              'Video & Voice Chat',
                              style: getsemiboldStyle(
                                  color: ColorManager.white,
                                  fontSize: AppSize.s30.mv),
                            ),
                            SizedBox(height: AppSize.s60),
                            // socialButton(
                            //     text: AppStrings.facebook,
                            //     color: ColorManager.white,
                            //     bgcolor: ColorManager.blue,
                            //     prfixicon: ImageAssets.facebookIcon,
                            //     onTap: () {
                            //       // Get.changeTheme(
                            //       //   Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
                            //       // );
                            //       if (rememberMe) {
                            //         Navigator.pushNamed(
                            //             context, Routes.recomendedTalentViewRoute);
                            //       } else {
                            //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            //             content: Text("Please Accept Terms and conditions")));
                            //       }
                            //     }),
                            // socialButton(
                            //     text: AppStrings.google,
                            //     bgcolor: ColorManager.primary,
                            //     color: ColorManager.white,
                            //     prfixicon: ImageAssets.googleIcon,
                            //     onTap: () {
                            //       //  Get.changeTheme(ThemeData.light());
                            //       if (rememberMe) {
                            //         Navigator.pushNamed(
                            //             context, Routes.recomendedTalentViewRoute);
                            //       } else {
                            //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            //             content: Text("Please Accept Terms and conditions")));
                            //       }
                            //     }),
                            socialButton(
                                text: AppStrings.facebook,
                                color: ColorManager.white,
                                bgcolor: ColorManager.blue,
                                prfixicon: ImageAssets.facebookIcon,
                                onTap: () {
                                  // Get.changeTheme(
                                  //   Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
                                  // );
                                  if (rememberMe) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text("Under Development")));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Please Accept Terms and conditions")));
                                  }
                                }),

                            facebookGoogleBtn(
                              isLoader: _.isLoading,
                              onFacebookTab: () {
                                if (rememberMe) {
                                  Navigator.pushNamed(
                                      context, Routes.loginRoute);
                                } else {
                                  showCustomSnackBar(
                                      'Please Accept Terms and conditions'.tr);
                                }
                              },
                              onGoogleTab: () async {
                                if (rememberMe) {
                                  UserCredential? userCredential =
                                      await signUpWithGoogle();
                                  if (userCredential != null) {
                                    final String? _name =
                                        userCredential.user!.displayName;
                                    final String? _email =
                                        userCredential.user!.email;
                                    final String? _password =
                                        userCredential.user!.uid;
                                    final String? _number =
                                        userCredential.user!.phoneNumber;
                                    _checkEmail(_, _email, _password, _name,
                                        _number.toString());
                                    // _signup(_,_email,_password,_name,_number.toString());
                                  }
                                } else {
                                  showCustomSnackBar(
                                      'Please Accept Terms and conditions'.tr);
                                }
                              },
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                      TermAndCondition(),

                      // Center(
                      //   child: CircularIconButton(
                      //       icon: Icons.more_horiz,
                      //       ),
                      // ),
                      // TermAndCondition(),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  _getVideoBackground() {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 1000),
      opacity: 1,
      child: VideoPlayer(_controller),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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

  Widget phoneEmailBtn({Function()? onPhoneTap, Function()? onEmailTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: onPhoneTap,
            child: Container(
              height: AppSize.s50,
              width: AppSize.s50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.lightblue,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  ImageAssets.phoneIcon,
                ),
              ),
            ),
          ),
          SizedBox(width: AppSize.s15),
          InkWell(
              onTap: onEmailTap,
              child: Container(
                height: AppSize.s50,
                width: AppSize.s50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.red,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.p12),
                  child: SvgPicture.asset(
                    ImageAssets.emailIcon,
                  ),
                ),
              )),
        ],
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

  Widget socialButton(
      {Color? bgcolor,
      String? text,
      String? prfixicon,
      Color? color,
      Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppSize.sizeWidth(context) * 0.06,
            vertical: AppSize.s10),
        child: Container(
          height: 55,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(
            horizontal: AppSize.sizeWidth(context) * 0.06,
          ),
          decoration: BoxDecoration(
            color: bgcolor,
            borderRadius: BorderRadius.circular(AppSize.s40),
          ),
          child: Padding(
            padding: EdgeInsets.only(

                // left: EdgeInsets.only(left:5),
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: SvgPicture.asset(
                    prfixicon!,
                    height: 35,
                    width: AppSize.s24,
                    color: ColorManager.white,
                  ),
                ),
                // SizedBox(width: 10.0),
                Text("Facebook",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500)),
                SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget facebookGoogleBtn(
      {Function()? onFacebookTab,
      Function()? onGoogleTab,
      required bool isLoader}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
      child: Column(
        children: [
          InkWell(
            onTap: onGoogleTab,
            child: Container(
              height: 55,
              width: MediaQuery.of(context).size.width / 1.29,
              margin: EdgeInsets.symmetric(
                horizontal: AppSize.sizeWidth(context) * 0.06,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppPadding.p40),
                color: Colors.white,
              ),
              child: isLoader
                  ? Center(
                      child: Container(
                          // margin: const EdgeInsets.all(AppPadding.p14),
                          height: AppPadding.p20,
                          width: AppPadding.p20,
                          // padding: const EdgeInsets.all(AppPadding.p14),
                          child: Loader()))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: SvgPicture.asset(
                            ImageAssets.googleIcon,
                            height: 35,
                            width: AppSize.s24,
                          ),
                        ),
                        Text("Google",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500)),
                        SizedBox(),
                      ],
                    ),
            ),
          ),
          SizedBox(
            height: AppPadding.p20,
          ),
          InkWell(
            onTap: onFacebookTab,
            child: Container(
              height: 55,
              width: MediaQuery.of(context).size.width / 1.29,
              margin: EdgeInsets.symmetric(
                horizontal: AppSize.sizeWidth(context) * 0.06,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppPadding.p40),
                color: Colors.grey.shade600,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(AppPadding.p18),
                    child: Icon(
                      Icons.mail,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Sign In with email",
                    style: getmediumStyle(
                      color: ColorManager.white,
                      fontSize: AppSize.s14.mv,
                    ),
                  ),
                  SizedBox(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: AppPadding.p20,
          ),
          Row(children: <Widget>[
            Expanded(
                child: Divider(
              height: 20,
              indent: 40,
              endIndent: 40,
              color: Colors.white,
            )),
            Text("or",
                style: TextStyle(
                  color: Colors.white,
                )),
            Expanded(
                child: Divider(
              height: 20,
              indent: 40,
              endIndent: 40,
              color: Colors.white,
            )),
          ]),
          SizedBox(
            height: AppPadding.p20,
          ),
          // showButtons
          // ?
          InkWell(
            onTap: () {
              setState(() {
                showButtons = true;
              });
            },
            child: showButtons == false
                ? Container(
                    width: 42, // Adjust size as needed
                    height: 42, // Adjust size as needed
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff1AABAF),
                    ),
                    child: Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                      size: 30,
                    ),
                  )
                : Container(
                    // height: 40,
                    width: MediaQuery.of(context).size.width / 1.29,
                    // color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 42, // Adjust size as needed
                          height: 42, // Adjust size as needed
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              'assets/images/whatsapp.svg',
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                        Container(
                          width: 42, // Adjust size as needed
                          height: 42, // Adjust size as needed
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              'assets/images/phone.svg',
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                        Container(
                          width: 42, // Adjust size as needed
                          height: 42, // Adjust size as needed
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              'assets/images/cross.svg',
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                        Container(
                          width: 42, // Adjust size as needed
                          height: 42, // Adjust size as needed
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.pink,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              'assets/images/user.svg',
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          )
        ],
      ),
    );
  }

  showButton() {
    setState(() {
      showButtons = !showButtons;
    });
  }

  Future<UserCredential?> signUpWithGoogle() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      await _auth.signOut();
      _googleSignIn.signOut();
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return userCredential;
      // Send user information to Laravel API
    } catch (e) {
      print('Error signing up with Google: $e');
      return null;
    }
  }

  void _checkEmail(
      AuthController authController, _email, _password, _name, _number) async {
    if (_email.isEmpty) {
      showCustomSnackBar('enter_email_address'.tr);
    } else {
      authController
          .checkEmail(
        _email,
      )
          .then((status) async {
        if (status.isSuccess) {
          _login(authController, _email, _password);
        } else {
          debugPrint(
              "=======status${status.isSuccess}:${status.message}=======");
          _signup(authController, _email, _password, _name, _number);
          await showCustomSnackBar(status.message);
        }
      });
    }
  }

  void _login(AuthController authController, _email, _password) async {
    if (_email.isEmpty) {
      showCustomSnackBar('enter_email_address'.tr);
    } else if (!GetUtils.isEmail(_email)) {
      showCustomSnackBar('enter_a_valid_email_address'.tr);
    } else if (_password.isEmpty) {
      showCustomSnackBar('enter_password'.tr);
    } else {
      authController.login(_email, _password).then((status) async {
        if (status.isSuccess) {
          debugPrint(
              "=======status${status.isSuccess}:${status.message}=======");
          Get.offAll(() => HomeView());
          // Navigator.pushNamedAndRemoveUntil(context, Routes.homeViewRoute, (route) => false);
        } else {
          debugPrint(
              "=======status${status.isSuccess}:${status.message}=======");
          showCustomSnackBar(status.message);
        }
      });
    }
  }

  void _signup(AuthController authController, _email, _password, _name,
      String _number) async {
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
    } else {
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
}

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  CircularIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 42, // Adjust size as needed
        height: 42, // Adjust size as needed
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff1AABAF),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
