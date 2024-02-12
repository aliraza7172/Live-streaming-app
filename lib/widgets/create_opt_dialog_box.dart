// ignore_for_file: deprecated_member_use

import 'package:stream_up_live/presentation/Mixins/size.dart';

import '../presentation/resources/index_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data/Live_Streaming/live_streaming_login_page.dart';

class CustomDialog extends StatefulWidget {
  CustomDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _scaleAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _scaleAnimation =
        CurvedAnimation(parent: _animationController!, curve: Curves.easeIn);
    _animationController!.addListener(() {
      setState(() {});
    });
    _animationController!.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: _scaleAnimation!,
        child: Dialog(
          elevation: 0,
          backgroundColor: ColorManager.primarydarkdarkColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(child: _buildDialogContent(context)),
        ));
  }

  Widget _buildDialogContent(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Text(
                  "CREATE Options",
                  style:
                      getboldStyle(color: ColorManager.white, fontSize: 14.mv),
                ),
                InkWell(
                  onTap: (() {
                    _animationController!.reverse();
                    Navigator.pop(context);
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorManager.primarydarkColor,
                        shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        ImageAssets.cancelIcon,
                        height: 14,
                        width: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.0),
          socialButton(
              text: AppStrings.createAStory,
              color: ColorManager.white,
              bgcolor: ColorManager.darkblue,
              prfixicon: ImageAssets.createaStoryIcon,
              onTap: () {
                // Get.changeTheme(
                //   Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
                // );
                Navigator.pop(context);
                Navigator.pushNamed(context, Routes.createStoryPage);
                // Navigator.pushNamed(context, Routes.CreateAStoryRoute);
              }),
          SizedBox(height: 5.0),
          socialButton(
              text: AppStrings.createAPost,
              color: ColorManager.white,
              bgcolor: ColorManager.green,
              prfixicon: ImageAssets.createaPostIcon,
              onTap: () {
                // Get.changeTheme(
                //   Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
                // );
                Navigator.pop(context);
                Navigator.pushNamed(context, Routes.createPostPage);
                // Navigator.pushNamed(context, Routes.CreatePostViewRoute);
              }),
          SizedBox(height: 5.0),

          ///
          ///
          ///
          ///
          ///
          ///
          ///*********************** */
          socialButton(
              text: AppStrings.golive,
              color: ColorManager.white,
              bgcolor: ColorManager.primary,
              prfixicon: ImageAssets.cameraIcon,
              onTap: () {
                print("object");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LiveStreamingLoginPage(),
                    ));
                // Navigator.pushNamed(context, Routes.LiveStreamingBasePage);
              }),

          ///
          ///
          ///
          ///
          ///
          ///
          ///
          ///
          ///
          ///****************************** */
          SizedBox(height: 5.0),
          socialButton(
              text: AppStrings.audioLive,
              color: ColorManager.white,
              bgcolor: ColorManager.primarydarkColor,
              prfixicon: ImageAssets.audioliveIcon,
              onTap: () {
                // Get.changeTheme(
                //   Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
                // );
                Navigator.pushNamed(context, Routes.AudioLiveViewRoute);
              }),
          SizedBox(height: 10.0),
        ]);
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
          decoration: BoxDecoration(
            color: bgcolor,
            borderRadius: BorderRadius.circular(AppSize.s10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: AppPadding.p12,
              bottom: AppPadding.p12,
              left: AppPadding.p40,
              right: AppPadding.p40,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  prfixicon!,
                  height: AppSize.s24,
                  width: AppSize.s24,
                  color: ColorManager.white,
                ),
                SizedBox(width: 10.0),
                Text(
                  text ?? "",
                  style:
                      getsemiboldStyle(color: color!, fontSize: AppSize.s12.mv),
                ),
                SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
