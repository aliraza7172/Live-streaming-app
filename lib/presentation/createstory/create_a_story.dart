// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/index_manager.dart';

class CreateAStory extends StatefulWidget {
  const CreateAStory({Key? key}) : super(key: key);

  @override
  State<CreateAStory> createState() => _CreateAStoryState();
}

class _CreateAStoryState extends State<CreateAStory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: AppSize.sizeWidth(context),
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.darken),
                  image: AssetImage(ImageAssets.createAstorybgImage),
                  fit: BoxFit.cover)),
          child: Container(
            height: AppSize.sizeHeight(context),
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  left: 10,
                  child: InkWell(
                    onTap: (() => Navigator.pop(context)),
                    child: SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset(
                          ImageAssets.arrowbackIcon,
                          color: ColorManager.white,
                        )),
                  ),
                ),
                rightICons(),
                saveandShare(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return Container(
            height: AppSize.sizeHeight(context) / 1.8,
            decoration: BoxDecoration(
              color: ColorManager.secondarydarkColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: const Radius.circular(18.0),
              ),
            ),
            child: Offstage(
              offstage: false,
              // !emojiShowing,
              child: EmojiPicker(
                  //textEditingController: _controller,
                  onEmojiSelected: (Category? category, Emoji emoji) {
                    // _onEmojiSelected(
                    //     emoji);
                  },
                  onBackspacePressed: () {}, //_onBackspacePressed,
                  config: Config(
                      columns: 4,
                      // Issue: https://github.com/flutter/flutter/issues/28894
                      emojiSizeMax: 48 * (Platform.isIOS ? 1.30 : 1.0),
                      verticalSpacing: 0,
                      horizontalSpacing: 0,
                      gridPadding: EdgeInsets.zero,
                      initCategory: Category.SMILEYS,
                      bgColor: ColorManager.secondarydarkColor,
                      indicatorColor: Colors.blue,
                      iconColor: Colors.grey,
                      iconColorSelected: Colors.blue,
                      // progressIndicatorColor: Colors.blue,
                      backspaceColor: Colors.blue,
                      skinToneDialogBgColor: Colors.white,
                      skinToneIndicatorColor: Colors.grey,
                      enableSkinTones: true,
                      //showRecentsTab: true,
                      recentsLimit: 28,
                      replaceEmojiOnLimitExceed: false,
                      noRecents: const Text(
                        'No Recents',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      tabIndicatorAnimDuration: kTabScrollDuration,
                      categoryIcons: const CategoryIcons(),
                      buttonMode: ButtonMode.MATERIAL)),
            ),
          );
        });
  }

  Widget saveandShare() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 60,
              width: 60,
              child: Column(
                children: [
                  SizedBox(
                      height: 30,
                      width: 30,
                      child: SvgPicture.asset(
                        ImageAssets.saveIcon,
                      )),
                  Text(
                    "Save",
                    style: getsemiboldStyle(
                        color: ColorManager.white, fontSize: 12.mv),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 15.0),
                  child: Text(
                    "SHARE",
                    style: getsemiboldStyle(
                        color: ColorManager.white, fontSize: 12.mv),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget rightICons() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: (() {
                _settingModalBottomSheet(context);
              }),
              child: SizedBox(
                  height: 25,
                  width: 25,
                  child: SvgPicture.asset(
                    ImageAssets.imogeIcon,
                    color: ColorManager.white,
                  )),
            ),
            SizedBox(height: 20.0),
            SizedBox(
                height: 25,
                width: 25,
                child: SvgPicture.asset(
                  ImageAssets.textIcon,
                  color: ColorManager.white,
                )),
            SizedBox(height: 20.0),
            SizedBox(
                height: 25,
                width: 25,
                child: SvgPicture.asset(
                  ImageAssets.musicIcon,
                  color: ColorManager.white,
                )),
            SizedBox(height: 20.0),
            SizedBox(
                height: 25,
                width: 25,
                child: SvgPicture.asset(
                  ImageAssets.animatorIcon,
                  color: ColorManager.white,
                )),
          ],
        ),
      ),
    );
  }
}
