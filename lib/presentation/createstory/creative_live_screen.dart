// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:stream_up_live/controller/go_live_controller.dart';
import 'package:stream_up_live/presentation/LivebroadCast/live_broad_cast_page.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../widgets/index_widget.dart';
import '../resources/index_manager.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';

class CreateLiveStory extends StatefulWidget {
  const CreateLiveStory({Key? key}) : super(key: key);

  @override
  State<CreateLiveStory> createState() => _CreateLiveStoryState();
}

class _CreateLiveStoryState extends State<CreateLiveStory>
    with SingleTickerProviderStateMixin {
  List tags = [
    "#Chat",
    "#Singing",
    "#Travel",
    "#Dancing",
    "#Dancing",
    "#Singing"
  ];

  List beautyUserImageList = [
    ImageAssets.beauty1Image,
    ImageAssets.beauty2Image,
    ImageAssets.beauty3Image,
    ImageAssets.beauty4Image,
    ImageAssets.beauty5Image,
    ImageAssets.beauty6Image,
    ImageAssets.beauty1Image,
    ImageAssets.beauty2Image,
    ImageAssets.beauty3Image,
    ImageAssets.beauty4Image,
    ImageAssets.beauty5Image,
    ImageAssets.beauty6Image,
  ];
  late TabController _controller;
  final _channelName = "testing"; //TextEditingController();
  String check = '';
  ClientRoleType? _role = ClientRoleType.clientRoleBroadcaster;
  // ClientRole? _role = ClientRole.Broadcaster;
int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;
  ChannelProfileType _channelProfileType =
      ChannelProfileType.channelProfileLiveBroadcasting;

Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(
      appId: "435bdec35eb94570b5bb1e1707d72f49",
      // appId: appId,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));

    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("local user ${connection.localUid} joined");
          setState(() {
            _localUserJoined = true;
          });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("remote user $remoteUid joined");
          setState(() {
            _remoteUid = remoteUid;
          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          debugPrint("remote user $remoteUid left channel");
          setState(() {
            _remoteUid = null;
          });
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint(
              '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
      ),
    );

    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine.enableVideo();
    await _engine.startPreview();
    await _engine.joinChannel(
      token: "007eJxTYKg6kz2n/MziGeprP925t8Z5xkyZGa9Xb+tKdPy3e/b7OD4eBQYTY9OklNRkY9PUJEsTU3ODJNOkJMNUQ3MD8xRzozQTy2efjqc0BDIyLLZJYWRkYGRgAWIQnwlMMoNJFjDJxlBcUpSamMvAAAArMyZY",
      // token: token,
      channelId: "stream",
      // channelId: channel,
      // info: '',
      uid: 0,
      options: ChannelMediaOptions(
        channelProfile: _channelProfileType,
        clientRoleType: ClientRoleType.clientRoleBroadcaster,
      ),
    );
  }

  void initState() {
    super.initState();
    // initAgora();
    // Ã¦Â·Â»Ã¥ÂŠÂ Ã§Â›Â‘Ã¥ÂÂ¬Ã¥Â™Â¨
    _controller = TabController(vsync: this, length: 2);
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GoLiveController>(
      init: GoLiveController(),
        builder: (_){
      return  Scaffold(
        body: SafeArea(
          child: Container(
            width: AppSize.sizeWidth(context),
            decoration: BoxDecoration(
                // image: DecorationImage(
                //     colorFilter: ColorFilter.mode(
                //         Colors.black.withOpacity(0.4), BlendMode.darken),
                //     image: AssetImage(ImageAssets.createLivebgImage), fit: BoxFit.cover)
            ),
            child: Container(
              height: AppSize.sizeHeight(context),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(child: CameraPreview(_.controller!)),
                    ],
                  ),
                  Positioned(
                    top: 20,
                    right: 10,
                    child: InkWell(
                      onTap: (() => Navigator.pop(context)),
                      child: SizedBox(
                          height: 20,
                          width: 20,
                          child: SvgPicture.asset(
                            ImageAssets.cancelIcon,
                            color: ColorManager.white,
                          )),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 20,
                    right: 20,
                    child: Container(
                      width: AppSize.sizeWidth(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: ColorManager.blackColor.withOpacity(0.3),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Stack(
                              children: [
                                Container(height: 80, width: 80),
                                Container(
                                  height: 77,
                                  width: 77,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    // borderRadius: BorderRadius.circular(10.0),
                                    // image: DecorationImage(
                                    //   fit: BoxFit.cover,
                                    //   image: AssetImage(ImageAssets.newUser1Image),
                                    // ),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: _.user.data!.baseUrl.toString()+"/"+_.user.data!.user!.image.toString(),
                                    placeholder: (context, url) =>
                                        CircleAvatar(
                                            radius: 10,
                                            child: const CircularProgressIndicator()),
                                    errorWidget: (context, url, error) => CircleAvatar(
                                      radius: 40.0,
                                      backgroundImage:
                                      AssetImage(ImageAssets.user_defaultImage),
                                    ),
                                    imageBuilder: (context, imageProvider) => Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              fit: BoxFit.cover, image: imageProvider)),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0.0,
                                  right: 0.0,
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorManager.blackColor.withOpacity(0.4),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: SvgPicture.asset(
                                          ImageAssets.cameraIcon,
                                        )),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: 16),
                            Container(
                              color: Colors.transparent,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    _.user.data?.user?.nickName!=null?_.user.data!.user!.nickName.toString():_.user.data!.user!.fullName.toString(),
                                    style: TextStyle(
                                        fontSize: 18.mv,
                                        color: ColorManager.white),
                                  ),
                                  SizedBox(height: 6),
                                  Row(
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: SvgPicture.asset(
                                            ImageAssets.multiliveIcon,
                                            color: ColorManager.white,
                                          )),
                                      Text(
                                        "Public",
                                        style: TextStyle(
                                            fontSize: 16.mv,
                                            color: ColorManager.white,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 180,
                    left: 20,
                    right: 20,
                    child: Container(
                      width: AppSize.sizeWidth(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: ColorManager.blackColor.withOpacity(0.3),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Enter Tag",
                              style: getmediumStyle(
                                  color: ColorManager.white, fontSize: 14.mv),
                            ),
                          ),
                          // SizedBox(height: 10.0),
                          // Container(
                          //     height: 25,
                          //     child: ListView.separated(
                          //       scrollDirection: Axis.horizontal,
                          //       itemCount: tags.length,
                          //       separatorBuilder: (context, i) =>
                          //           SizedBox(width: 5.0),
                          //       itemBuilder: (context, index) => Padding(
                          //         padding:
                          //             const EdgeInsets.symmetric(horizontal: 0.0),
                          //         child: Container(
                          //           decoration: BoxDecoration(
                          //               color: ColorManager.grey,
                          //               borderRadius:
                          //                   BorderRadius.circular(20.0)),
                          //           child: Padding(
                          //             padding: const EdgeInsets.symmetric(
                          //                 vertical: 5.0, horizontal: 5.0),
                          //             child: Text(
                          //               tags[index],
                          //               style:
                          //                   getRegularStyle(color: Colors.white),
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     )),
                          inputFiled(),
                        ],
                      ),
                    ),
                  ),
                  bottomBox(_),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        // ColorManager.secondarydarkColor,
        context: context,

        // barrierColor: ColorManager.primary,
        isScrollControlled: true,
        builder: (context) {
          return SingleChildScrollView(
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 282,
                    decoration: BoxDecoration(
                      color: ColorManager.secondarydarkColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18.0),
                        topRight: const Radius.circular(18.0),
                      ),
                    ),
                    child: DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TabBar(
                                controller: _controller,
                                indicatorColor: ColorManager.primary,
                                labelColor: ColorManager.primary,
                                unselectedLabelColor:
                                    ColorManager.hinttextdarkColor,
                                labelStyle: getsemiboldStyle(
                                    color: ColorManager.primary,
                                    fontSize: 14.mv),
                                tabs: [
                                  Tab(
                                    text: "Stickers",
                                    //icon: Icon(Icons.cloud_outlined),
                                  ),
                                  Tab(
                                    text: "Beauty",
                                    //  icon: Icon(Icons.beach_access_sharp),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _controller,
                                  children: <Widget>[
                                    Offstage(
                                      offstage: false,
                                      // !emojiShowing,
                                      child: SizedBox(
                                        height: 250,
                                        child: EmojiPicker(
                                            //textEditingController: _controller,
                                            onEmojiSelected:
                                                (Category? category,
                                                    Emoji emoji) {
                                              // _onEmojiSelected(
                                              //     emoji);
                                            },
                                            onBackspacePressed:
                                                () {}, //_onBackspacePressed,
                                            config: Config(
                                                columns: 7,
                                                // Issue: https://github.com/flutter/flutter/issues/28894
                                                emojiSizeMax: 32 *
                                                    (Platform.isIOS
                                                        ? 1.30
                                                        : 1.0),
                                                verticalSpacing: 0,
                                                horizontalSpacing: 0,
                                                gridPadding: EdgeInsets.zero,
                                                initCategory: Category.SMILEYS,
                                                bgColor: ColorManager
                                                    .secondarydarkColor,
                                                // const Color(
                                                //     0xFFF2F2F2),
                                                indicatorColor: Colors.blue,
                                                iconColor: Colors.grey,
                                                iconColorSelected: Colors.blue,
                                                // progressIndicatorColor:
                                                //     Colors.blue,
                                                backspaceColor: Colors.blue,
                                                skinToneDialogBgColor:
                                                    Colors.white,
                                                skinToneIndicatorColor:
                                                    Colors.grey,
                                                enableSkinTones: true,
                                                //  showRecentsTab: true,
                                                recentsLimit: 28,
                                                replaceEmojiOnLimitExceed:
                                                    false,
                                                noRecents: const Text(
                                                  'No Recents',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                  textAlign: TextAlign.center,
                                                ),
                                                tabIndicatorAnimDuration:
                                                    kTabScrollDuration,
                                                categoryIcons:
                                                    const CategoryIcons(),
                                                buttonMode:
                                                    ButtonMode.MATERIAL)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 5.0),
                                      child: GridView.builder(
                                        // physics:
                                        //     NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 10,
                                          // mainAxisExtent:
                                          //     295, // here set custom Height You Want
                                        ),
                                        shrinkWrap: true,
                                        itemCount: beautyUserImageList.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          if (index == 0) {
                                            return Container(
                                                height: 30,
                                                width: 30,
                                                color: ColorManager
                                                    .primarydarkdarkColor,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  child: SvgPicture.asset(
                                                    ImageAssets.noneIcon,
                                                  ),
                                                ));
                                          } else
                                            return Container(
                                                height: 30,
                                                width: 30,
                                                child: Image.asset(
                                                    beautyUserImageList[
                                                        index]));
                                        },
                                        //),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                      ),
                    ));
              }),
            ),
          );
        });
  }

  Widget bottomBox(GoLiveController controller) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: AppSize.sizeWidth(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector (
                    onTap: (){
                      print("============");
                      controller.toggleCamera();
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset(ImageAssets.switchCameraIcon),
                        Text(
                          "Switch Camera",
                          style: getmediumStyle(color: ColorManager.white),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 50.0),
                  GestureDetector(
                    onTap: () {
                      _settingModalBottomSheet(context);
                    },
                    child: Column(
                      children: [
                        SvgPicture.asset(ImageAssets.stickerBeautyIcon),
                        Text(
                          "Sticker/Beaty",
                          style: getmediumStyle(color: ColorManager.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              //---------------Go live Button-----------------
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.sizeWidth(context) * 0.10,
                    vertical: 10.0),
                child: CustomButton(
                  color: ColorManager.primary,
                  text: "GO LIVE ",
                  style: getboldStyle(
                    color: ColorManager.white,
                    fontSize: AppSize.s12.mv,
                  ),
                  onTap: onJoin,
                  // () {

                  //  // onJoin(isBroadcaster: true);
                  //   // Navigator.pushNamed(context, Routes.liveViewRoute);
                  // }
                ),
              ),
              // SizedBox(height: 10.0),
              //----------------------live audio live---------
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Column(
              //         children: [
              //           Container(
              //               decoration: BoxDecoration(
              //                 color: ColorManager.green,
              //                 shape: BoxShape.circle,
              //               ),
              //               child: Padding(
              //                 padding: const EdgeInsets.all(12.0),
              //                 child: SvgPicture.asset(ImageAssets.cameraIcon),
              //               )),
              //           Text(
              //             "LIVE",
              //             style: getmediumStyle(color: ColorManager.white),
              //           )
              //         ],
              //       ),
              //       Column(
              //         children: [
              //           Container(
              //             decoration: BoxDecoration(
              //               color: ColorManager.blackColor.withOpacity(0.3),
              //               shape: BoxShape.circle,
              //             ),
              //             child: Padding(
              //               padding: const EdgeInsets.all(12.0),
              //               child: SvgPicture.asset(ImageAssets.audioliveIcon),
              //             ),
              //           ),
              //           Text(
              //             "Audio LIVE",
              //             style: getmediumStyle(color: ColorManager.white),
              //           )
              //         ],
              //       ),
              //       Column(
              //         children: [
              //           Container(
              //               decoration: BoxDecoration(
              //                 color: ColorManager.blackColor.withOpacity(0.3),
              //                 shape: BoxShape.circle,
              //               ),
              //               child: Padding(
              //                 padding: const EdgeInsets.all(12.0),
              //                 child:
              //                     SvgPicture.asset(ImageAssets.multiliveIcon),
              //               )),
              //           Text(
              //             "Multiple LIVE",
              //             style: getmediumStyle(color: ColorManager.white),
              //           )
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // // Display remote user's video
//   Widget _remoteVideo() {
//     if (_remoteUid != null) {
//       return AgoraVideoView(
//         controller: VideoViewController.remote(
//           rtcEngine: _engine,
//           canvas: VideoCanvas(uid: _remoteUid),
//           connection: const RtcConnection(channelId: channel),
//         ),
//       );
//     } else {
//       return const Text(
//         'Please wait for remote user to join',
//         textAlign: TextAlign.center,
//       );
//     }
//   }
/*
  Future<void> onJoin({bool? isBroadcaster}) async {
    //await [Permission.camera, Permission.microphone].request();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BroadcastPage(
          channelName: AppStrings.channelName.toString(), //_channelName.text,
          isBroadcaster: isBroadcaster,
        ),
      ),
    );
  }
  */
  Future<void> onJoin() async {
    // update input validation
    // setState(() {
    //   _channelController.text.isEmpty
    //       ? _validateError = true
    //       : _validateError = false;
    // });
    if (_channelName.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic(Permission.camera);
      await _handleCameraAndMic(Permission.microphone);
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            channelName: _channelName, // _channelController.text,
            //channelName: _channelController.text,
            role: _role,
          ),
        ),
      );
    }
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }

  Widget inputFiled() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        // maxLines: 2,
        style: TextStyle(color: ColorManager.white),
        decoration: InputDecoration(
          hintText: 'Enter a text',
          hintStyle: getsemiboldStyle(color: ColorManager.white),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
