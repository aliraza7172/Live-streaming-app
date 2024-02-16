import 'dart:ui';
// import 'auto';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:stream_up_live/presentation/live_audio_room/circle_image_text.dart';
import 'package:stream_up_live/presentation/resources/index_manager.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';
import '../../presentation/live_audio_room/circle_image.dart';
import '../../presentation/live_audio_room/circle_image_outer.dart';
import '../../theme/theme_helper.dart';
import '../../utils/image_constant.dart';
import '../../utils/size_utils.dart';
import 'Components/leave_confirmation_dialog.dart';
import 'zego_info.dart';

class LiveStreamingBasePage extends StatefulWidget {
  const LiveStreamingBasePage({super.key});

  @override
  State<LiveStreamingBasePage> createState() => _LiveStreamingBasePageState();
}

class _LiveStreamingBasePageState extends State<LiveStreamingBasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Zego Cloud Zim Login Page.'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: ListView(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ZegoLiveStream(
                              userId: "111111",
                              userName: "Start Live Stream",
                              liveId: "123123"),
                        ));
                  },
                  child: const Text("Start Live Stream")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ZegoLiveStream(
                              userId: "121212",
                              userName: "Join",
                              liveId: "123123"),
                        ));
                  },
                  child: const Text("Join Live Stream")),
            ],
          ),
        ));
  }
}

// ! Live Streaming Separate Code .
class ZegoLiveStream extends StatefulWidget {
  const ZegoLiveStream(
      {super.key,
      required this.userId,
      required this.userName,
      required this.liveId});
  final String userId;
  final String userName;
  final String liveId;
  @override
  State<ZegoLiveStream> createState() => _ZegoLiveStreamState();
}

class _ZegoLiveStreamState extends State<ZegoLiveStream> {
  late Size size;

  bool isPublish = true;
  // Custom Bottom menu show icons .
  List<IconData> customIcons = [
    Icons.cookie,
    Icons.phone,
    Icons.speaker,
    Icons.air,
    Icons.blender,
    Icons.file_copy,
    Icons.place,
    Icons.phone_android,
    Icons.phone_iphone,
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.sizeOf(context);
    return Sizer(builder: (context, orientation, deviceType) {
      return SafeArea(
        top: true,
        child: ZegoUIKitPrebuiltLiveStreaming(
          appID: ZegoCloudInfo.appID,
          appSign: ZegoCloudInfo.appSign,
          userID: widget.userId,
          userName: widget.userName,

          /// ! hm jb live id ko pass krwaty ha to hmy apne (Admin) aur apny new (joiner) ki live
          /// ! id same rkne ha q ka agr ak jase id ho ge to (Admin) aur new (Joiner) ak hi id
          /// ! pr apni talking kr skty ha .
          liveID: widget.liveId,
          events: events,
          config: widget.userId == "111111"
              ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
              : ZegoUIKitPrebuiltLiveStreamingConfig.audience()
            ..background = _background()
            ..foreground = _coverToForegroundArea(size: size)
            // ! pictureInPicture Allow .
            ..layout = ZegoLayout.pictureInPicture(
                smallViewPosition: ZegoViewPosition.bottomRight,
                isSmallViewsScrollable: true,
                visibleSmallViewsCount: 2,
                showScreenSharingFullscreenModeToggleButtonRules:
                    ZegoShowFullscreenModeToggleButtonRules.alwaysHide)
            // Joining Micro Phone .
            ..turnOnMicrophoneWhenJoining = true
            // ! preview Video Live Page
            ..preview.showPreviewForHost = true
            ..advanceConfigs = {AppStrings.Bubbles: "Jawad"}
            ..useSpeakerWhenJoining = true
            // ! top Menu Bar Sections .
            ..topMenuBar.buttons = [
              ZegoLiveStreamingMenuBarButtonName.expanding,
              ZegoLiveStreamingMenuBarButtonName.leaveButton,
            ]
            ..topMenuBar.backgroundColor = ColorManager.transparent
            ..topMenuBar.height = 80
            ..topMenuBar.buttons = [
              ZegoLiveStreamingMenuBarButtonName.chatButton
            ]
            ..topMenuBar.hostAvatarBuilder = (ZegoUIKitUser host) {
              return topMenuBarHostAvatarBuilder(host: host, size: size);
            }
            // ! Bottom Menu Bar
            ..bottomMenuBar.backgroundColor = Colors.transparent
            // buttonStyle
            ..bottomMenuBar.buttonStyle = ZegoLiveStreamingBottomMenuBarButtonStyle(

                //! Beauty button
                // beautyEffectButtonIcon: beautyEffectButtonIcon(),
                // toggleMicrophoneOnButtonIcon: SizedBox(
                //     child: Image(image: AssetImage(ImageAssets.topMenuImages)))
                )
            ..bottomMenuBar.maxCount = 3 // bottom bar count number .
            ..bottomMenuBar = ZegoLiveStreamingBottomMenuBarConfig(
                hostExtendButtons: customButtonButtons)
            //  Custom Ui (ZegoLiveStreamingInRoomMessageConfig) Design .
            ..inRoomMessage =
                ZegoLiveStreamingInRoomMessageConfig(visible: true)
            // ! Chat Message Avatar Builder
            ..avatarBuilder = (context, size, user, extraInfo) {
              return user != null
                  ? avatarBuilderChatMessage()
                  : const SizedBox();
            }
            // ! New Member Top Button
            ..memberList = ZegoLiveStreamingMemberListConfig()
            ..memberButton = ZegoLiveStreamingMemberButtonConfig(
              builder: (memberCount) {
                // join this member
                if (memberCount == 1) {
                  return newMemberCountJoinDesign(memberCount);
                } else {
                  return AutoSizeText("data");
                }
              },
            )
            ..turnOnCameraWhenCohosted = () {
              return false;
            }
            // ! AudioVideoView BackgroundBuilder
            ..audioVideoView.backgroundBuilder = (BuildContext context,
                Size size, ZegoUIKitUser? user, Map extraInfo) {
              return user != null
                  ? ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Image(
                        image: NetworkImage(
                          'https://your_server/app/user_image/${user.id}.png',
                        ),
                      ),
                    )
                  : const SizedBox();
            },
        ),
      );
    });
  }

  // Events .
  ZegoUIKitPrebuiltLiveStreamingEvents get events {
    return ZegoUIKitPrebuiltLiveStreamingEvents(onLeaveConfirmation: (
      ZegoLiveStreamingLeaveConfirmationEvent event,

      /// defaultAction to return to the previous page
      Future<bool> Function() defaultAction,
    ) async {
      return await setUpLeaveConfirmationDialog(context);
    }, coHost: ZegoLiveStreamingCoHostEvents(
        audience: ZegoLiveStreamingCoHostAudienceEvents(
      onActionAcceptInvitation: () {
        Navigator.of(context).pop('accept');
      },
    )));
  }

  // ! custom Bottom Buttons .
  List<ZegoLiveStreamingMenuBarExtendButton> get customButtonButtons {
    return customIcons
        .map(
          (customIcon) => ZegoLiveStreamingMenuBarExtendButton(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                // maximumSize: Size(30,30),
                fixedSize: const Size(20, 20),
                shape: const CircleBorder(),
                alignment: Alignment.center,
                backgroundColor: const Color(0xff2C2F3E).withOpacity(0.6),
              ),
              onPressed: () {},
              child: Center(child: Icon(customIcon)),
            ),
          ),
        )
        .toList();
  }

  // _Cover To Foreground Area
  Widget _coverToForegroundArea({required Size size}) {
    return Padding(
      padding:
          EdgeInsets.only(top: size.height * 0.13, left: size.width * 0.06),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ! coin section .
          Expanded(
            child: Container(
              width: size.width * 0.3,
              height: size.height * 0.04,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: ColorManager.transparentLight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Image(
                      image: AssetImage(ImageAssets.streamDollar),
                      height: 20,
                      width: 20,
                    ),
                  ),
                  AutoSizeText(
                    "11122233",
                    style: getsemiboldStyle(color: ColorManager.white)
                        .copyWith(fontSize: 14),
                    presetFontSizes: [12, 8, 5],
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: size.width * 0.3),
          //  ! 2 section
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 5),
              child: Container(
                height: 80,
                width: 80,
                color: ColorManager.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        foregroundIconsStream(
                            size: size,
                            imagePath: ImageAssets.userSettingStreamLive),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        foregroundIconsStream(
                            size: size, imagePath: ImageAssets.musicStream),
                      ],
                    ),
                    Container(
                        height: size.height * 0.05,
                        width: size.width * 0.25,
                        decoration: BoxDecoration(
                            color: ColorManager.transparentLight,
                            borderRadius: BorderRadius.circular(30)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: Expanded(
                                child: Image(
                                  image: AssetImage(ImageAssets.timeIconStream),
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                            AutoSizeText("11:33:00"),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Background Join page .
  Widget _background() {
    /// how to replace background view
    return Stack(
      children: [
        Positioned(
            top: 15,
            left: 10,
            child: CircularImageOuter(
              outerImagePath: ImageConstant.imgMaxRemovebgPreview,
              innerImagePath: ImageConstant.imgImagesRemovebgPreview,
              innerSize: 50,
              outerSize: 70,
            )),
        Positioned(
          top: 10 + 20,
          left: 70,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            decoration: BoxDecoration(
              color: appTheme.black900.withOpacity(0.15),
              borderRadius: BorderRadius.circular(
                19.h,
              ),
            ),
            child: Padding(
              padding:
                  EdgeInsets.only(top: 8.v, right: 7.h, left: 10.h, bottom: 5),
              child: Text(
                'Jawad Jani\n${"123123"}',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: 10 + 20,
            left: 180,
            child: CircularImageText(
              outerImagePath: ImageConstant.imgMaxRemovebgPreview,
              innerImagePath: ImageConstant.imgImagesRemovebgPreview,
              outerSize: 50,
              innerSize: 35,
              text: '100K',
            )),
        Positioned(
            top: 10 + 20,
            left: 235,
            child: CircularImageText(
              outerImagePath: ImageConstant.imgMaxRemovebgPreview,
              innerImagePath: ImageConstant.imgImagesRemovebgPreview,
              outerSize: 45,
              innerSize: 30,
              text: '70K',
            )),
        Positioned(
            top: 10 + 25,
            left: 288,
            child: CircularImage(
              innerImagePath: ImageConstant.imgImagesRemovebgPreview,
              outerSize: 40,
              innerSize: 40,
              text: '50K',
            ))
      ],
    );
  }

  Widget foregroundIconsStream(
      {required Size size, required String imagePath}) {
    return Container(
        height: size.height * 0.05,
        width: size.width * 0.099,
        decoration: BoxDecoration(
            color: ColorManager.transparentLight,
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Image(
            image: AssetImage(imagePath),
            height: 20,
            width: 20,
          ),
        ));
  }

  // ! Chat Message Avatar Builder Image
  Widget avatarBuilderChatMessage() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            ImageConstant.imgImagesRemovebgPreview,
          ),
        ),
      ),
    );
  }

  // New Member Count Join Design
  Widget newMemberCountJoinDesign(int memberCount) {
    return Container(
      width: size.width * 0.18,
      height: size.height * 0.04,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: ColorManager.transparentLight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.person,
            color: Color.fromARGB(255, 6, 214, 158),
          ),
          AutoSizeText("${memberCount} ",
              style: TextStyle(color: Color.fromARGB(255, 6, 214, 158))),
        ],
      ),
    );
  }

  // ** Beauty Effect Button Icon .
  Container beautyEffectButtonIcon() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorManager.transparentLight,
        ),
        height: 50,
        width: 60,
        child: CircleAvatar(
            backgroundColor: ColorManager.transparent,
            child: Image(image: AssetImage(ImageAssets.topMenuImages))));
  }

  // ** Top Menu Bar Host Avatar Builder
  Widget topMenuBarHostAvatarBuilder(
          {required ZegoUIKitUser host, required Size size}) =>
      Container(
          height: size.height * 0.2,
          width: size.width * 0.6,
          decoration: BoxDecoration(
            color: ColorManager.transparent,
          ),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Positioned(
                  top: 10,
                  left: 10,
                  child: CircularImageOuter(
                    outerImagePath: ImageConstant.imgMaxRemovebgPreview,
                    innerImagePath: ImageConstant.imgImagesRemovebgPreview,
                    innerSize: 30,
                    outerSize: 50,
                  )),
              Positioned(
                top: 10,
                left: 50,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  decoration: BoxDecoration(
                    color: appTheme.black900.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(
                      19.h,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 8.v, right: 7.h, left: 10.h, bottom: 5),
                    child: Text(
                      'Jawad Jani\n${"widget"}',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
              // Positioned(
              //   left: -7,
              //   bottom: -3,
              //   child: SizedBox(
              //       height: size.height * 0.08,
              //       width: size.width * 0.17,
              //       child: Image(image: AssetImage(ImageAssets.topMenuImages))),
              // ),
              // Positioned(
              //   right: 12,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       AutoSizeText(host.name),
              //       AutoSizeText("ID: ${host.id}"),
              //     ],
              //   ),
              // ),
            ],
          ));
}

//  extension BoxDecoration .
extension DecorationCard on BoxDecoration {
  BoxDecoration get decorationCard => BoxDecoration(
      borderRadius: this.borderRadius ?? BorderRadius.circular(30),
      color: this.color ?? ColorManager.transparentLight);
}

/**
 * 
 */
