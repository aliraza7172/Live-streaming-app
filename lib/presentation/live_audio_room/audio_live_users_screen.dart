// ignore_for_file: deprecated_member_use

import 'package:stream_up_live/presentation/live_audio_room/circle_image_outer.dart';
import 'package:stream_up_live/presentation/live_audio_room/circle_image_text.dart';
import 'package:stream_up_live/presentation/live_audio_room/zego_media.dart';
import 'package:stream_up_live/presentation/resources/index_manager.dart';
import 'package:stream_up_live/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit/zego_uikit.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/zego_uikit_prebuilt_live_audio_room.dart';
import 'gift_screen_widgets.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/image_constant.dart';
import '../../widgets/custom_icon_button.dart';
import 'circle_image.dart';
import 'custom_image_view.dart';

class AudioLiveUsersView extends StatefulWidget {
  final String roomID;
  final bool isHost;
  final LayoutMode layoutMode;

  const AudioLiveUsersView({
    Key? key,
    required this.roomID,
    this.layoutMode = LayoutMode.defaultLayout,
    this.isHost = false,
  }) : super(key: key);

  @override
  State<AudioLiveUsersView> createState() => _AudioLiveUsersViewState();
}

class _AudioLiveUsersViewState extends State<AudioLiveUsersView>
    with SingleTickerProviderStateMixin {
  List<IconData> customIcons = [
    Icons.cookie,
    Icons.phone,
    Icons.speaker,
    Icons.air,
    Icons.blender,
    Icons.file_copy,
    Icons.place,
    Icons.phone_android,
    Icons.phone_iphone
  ];

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return SafeArea(
        child: ZegoUIKitPrebuiltLiveAudioRoom(
          appID: zegoAppId /*input your AppID*/,
          appSign: zegoAppSign /*input your AppSign*/,
          userID: localUserID,
          userName: 'user_$localUserID',
          roomID: widget.roomID,
          events: events,
          config: config,
        ),
      );
    });
  }

  ZegoUIKitPrebuiltLiveAudioRoomConfig get config {
    return (widget.isHost
        ? ZegoUIKitPrebuiltLiveAudioRoomConfig.host()
        : ZegoUIKitPrebuiltLiveAudioRoomConfig.audience()
      ..seat = (getSeatConfig()
        ..takeIndexWhenJoining = widget.isHost ? getHostSeatIndex() : -1
        ..hostIndexes = getLockSeatIndex())
      ..background = _background()
      ..foreground = _foreground()
      ..topMenuBar.buttons = [
        ZegoLiveAudioRoomMenuBarButtonName.closeSeatButton
      ]
      ..bottomMenuBar.hostExtendButtons = [
        _getGiftButton(context)
      ]
      ..seat.avatarBuilder = (BuildContext context, Size size,
          ZegoUIKitUser? user, Map<String, dynamic>? extraInfo) {
        return CircularImageOuter(
          outerImagePath: ImageConstant.imgMaxRemovebgPreview66x50,
          innerImagePath: ImageConstant.imgImagesRemovebgPreview,
          outerSize: 100,
          innerSize: 40,
        );
      });
  }
  //..userAvatarUrl = 'https://robohash.org/$localUserID.png';

  ZegoUIKitPrebuiltLiveAudioRoomEvents get events {
    return ZegoUIKitPrebuiltLiveAudioRoomEvents(
      user: ZegoLiveAudioRoomUserEvents(
        onCountOrPropertyChanged: (List<ZegoUIKitUser> users) {
          debugPrint(
            'onUserCountOrPropertyChanged:${users.map((e) => e.toString())}',
          );
        },
      ),
      seat: ZegoLiveAudioRoomSeatEvents(
        onClosed: () {
          debugPrint('on seat closed');
        },
        onOpened: () {
          debugPrint('on seat opened');
        },
        onChanged: (
          Map<int, ZegoUIKitUser> takenSeats,
          List<int> untakenSeats,
        ) {
          debugPrint(
            'on seats changed, taken seats:$takenSeats, untaken seats:$untakenSeats',
          );
        },

        /// WARNING: will override prebuilt logic
        // onClicked:(int index, ZegoUIKitUser? user) {
        //   debugPrint(
        //       'on seat clicked, index:$index, user:${user.toString()}');
        // },
        host: ZegoLiveAudioRoomSeatHostEvents(
          onTakingRequested: (ZegoUIKitUser audience) {
            debugPrint('on seat taking requested, audience:$audience');
          },
          onTakingRequestCanceled: (ZegoUIKitUser audience) {
            debugPrint('on seat taking request canceled, audience:$audience');
          },
          onTakingInvitationFailed: () {
            debugPrint('on invite audience to take seat failed');
          },
          onTakingInvitationRejected: (ZegoUIKitUser audience) {
            debugPrint('on seat taking invite rejected');
          },
        ),
        audience: ZegoLiveAudioRoomSeatAudienceEvents(
          onTakingRequestFailed: () {
            debugPrint('on seat taking request failed');
          },
          onTakingRequestRejected: () {
            debugPrint('on seat taking request rejected');
          },
          onTakingInvitationReceived: () {
            debugPrint('on host seat taking invite sent');
          },
        ),
      ),

      /// WARNING: will override prebuilt logic
      memberList: ZegoLiveAudioRoomMemberListEvents(
        onMoreButtonPressed: onMemberListMoreButtonPressed,
      ),
    );
  }

  Widget _foreground() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container();

        return simpleMediaPlayer(
          canControl: widget.isHost,
        );

        return advanceMediaPlayer(
          constraints: constraints,
          canControl: widget.isHost,
        );
      },
    );
  }

  Widget _background() {
    /// how to replace background view
    return Stack(
      children: [
        Container(
          color: ColorManager.secondarydarkColor,
        ),
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
                'Pranto Khan\n${widget.roomID}',
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

  ZegoLiveAudioRoomSeatConfig getSeatConfig() {
    return ZegoLiveAudioRoomSeatConfig(
        layout: ZegoLiveAudioRoomLayoutConfig(rowConfigs: [
      ZegoLiveAudioRoomLayoutRowConfig(
          count: 1, alignment: ZegoLiveAudioRoomLayoutAlignment.center),
      ZegoLiveAudioRoomLayoutRowConfig(
          count: 4, alignment: ZegoLiveAudioRoomLayoutAlignment.spaceAround),
      ZegoLiveAudioRoomLayoutRowConfig(
          count: 4, alignment: ZegoLiveAudioRoomLayoutAlignment.spaceAround),
    ]));
  }

  int getHostSeatIndex() {
    if (widget.layoutMode == LayoutMode.hostCenter) {
      return 4;
    }

    return 0;
  }

  List<int> getLockSeatIndex() {
    if (widget.layoutMode == LayoutMode.hostCenter) {
      return [4];
    }

    return [0];
  }

  ZegoLiveAudioRoomLayoutConfig getLayoutConfig() {
    final config = ZegoLiveAudioRoomLayoutConfig();
    switch (widget.layoutMode) {
      case LayoutMode.defaultLayout:
        break;
      case LayoutMode.full:
        config.rowSpacing = 5;
        config.rowConfigs = List.generate(
          4,
          (index) => ZegoLiveAudioRoomLayoutRowConfig(
            count: 4,
            alignment: ZegoLiveAudioRoomLayoutAlignment.spaceBetween,
          ),
        );
        break;
      case LayoutMode.horizontal:
        config.rowSpacing = 5;
        config.rowConfigs = [
          ZegoLiveAudioRoomLayoutRowConfig(
            count: 8,
            alignment: ZegoLiveAudioRoomLayoutAlignment.spaceBetween,
          ),
        ];
        break;
      case LayoutMode.vertical:
        config.rowSpacing = 5;
        config.rowConfigs = List.generate(
          8,
          (index) => ZegoLiveAudioRoomLayoutRowConfig(
            count: 1,
            alignment: ZegoLiveAudioRoomLayoutAlignment.spaceBetween,
          ),
        );
        break;
      case LayoutMode.hostTopCenter:
        config.rowConfigs = [
          ZegoLiveAudioRoomLayoutRowConfig(
            count: 1,
            alignment: ZegoLiveAudioRoomLayoutAlignment.center,
          ),
          ZegoLiveAudioRoomLayoutRowConfig(
            count: 3,
            alignment: ZegoLiveAudioRoomLayoutAlignment.spaceBetween,
          ),
          ZegoLiveAudioRoomLayoutRowConfig(
            count: 3,
            alignment: ZegoLiveAudioRoomLayoutAlignment.spaceBetween,
          ),
          ZegoLiveAudioRoomLayoutRowConfig(
            count: 2,
            alignment: ZegoLiveAudioRoomLayoutAlignment.spaceEvenly,
          ),
        ];
        break;
      case LayoutMode.hostCenter:
        config.rowSpacing = 5;
        config.rowConfigs = [
          ZegoLiveAudioRoomLayoutRowConfig(
            count: 3,
            alignment: ZegoLiveAudioRoomLayoutAlignment.spaceBetween,
          ),
          ZegoLiveAudioRoomLayoutRowConfig(
            count: 3,
            alignment: ZegoLiveAudioRoomLayoutAlignment.spaceBetween,
          ),
          ZegoLiveAudioRoomLayoutRowConfig(
            count: 3,
            alignment: ZegoLiveAudioRoomLayoutAlignment.spaceBetween,
          ),
        ];
        break;
      case LayoutMode.fourPeoples:
        config.rowConfigs = [
          ZegoLiveAudioRoomLayoutRowConfig(
            count: 4,
            alignment: ZegoLiveAudioRoomLayoutAlignment.spaceBetween,
          ),
        ];
        break;
    }
    return config;
  }

  void onMemberListMoreButtonPressed(ZegoUIKitUser user) {
    showModalBottomSheet(
      backgroundColor: const Color(0xff111014),
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
      ),
      isDismissible: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        const textStyle = TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        );
        final listMenu = ZegoUIKitPrebuiltLiveAudioRoomController()
                .seat
                .localHasHostPermissions
            ? [
                GestureDetector(
                  onTap: () async {
                    Navigator.of(context).pop();

                    ZegoUIKit().removeUserFromRoom(
                      [user.id],
                    ).then((result) {
                      debugPrint('kick out result:$result');
                    });
                  },
                  child: Text(
                    'Kick Out ${user.name}',
                    style: textStyle,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.of(context).pop();

                    ZegoUIKitPrebuiltLiveAudioRoomController()
                        .seat
                        .host
                        .inviteToTake(user.id)
                        .then((result) {
                      debugPrint('invite audience to take seat result:$result');
                    });
                  },
                  child: Text(
                    'Invite ${user.name} to take seat',
                    style: textStyle,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Cancel',
                    style: textStyle,
                  ),
                ),
              ]
            : [];
        return AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets,
          duration: const Duration(milliseconds: 50),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 10,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listMenu.length,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 60,
                  child: Center(child: listMenu[index]),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _getGiftButton(BuildContext context){
    return CustomIconButton(
      height: 40.adaptSize,
      width: 40.adaptSize,
      padding: EdgeInsets.all(7.h),
      decoration: IconButtonStyleHelper.fillPink,
      child: CustomImageView(
        imagePath: ImageConstant.imgGroup25,
      ),
      onTap: (){
        print("Gift open");
        _showBottomSheet(context);
      },
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            color: ColorManager.giftScreenColor,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 7.h,
              vertical: 11.v,
            ),
            child: Column(
              children: [
                buildPartOne(context),
                SizedBox(height: 17.v),
                buildPartTwo(),
                SizedBox(height: 7.v),
                buildPartThree(),
                SizedBox(height: 18.v),
                buildPartFour(context),


              ],
            ),
          );
        }
    );
  }

}


