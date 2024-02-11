import 'dart:async';

// import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
// import 'package:agora_rtc_engine/rtc_engine.dart';
// import 'package:bano_live/presentation/resources/agrokey/agora_key.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:stream_up_live/agora/agora_widget.dart';

import '../resources/index_manager.dart';

class CallPage extends StatefulWidget {
  /// non-modifiable channel name of the page
  final String? channelName;

  /// non-modifiable client role of the page
  final ClientRoleType? role;
  // final ClientRole? role;

  /// Creates a call page with given channel name.
  const CallPage({Key? key, this.channelName, 
  this.role
  }) : super(key: key);

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  final _users = <int>[];
  final _infoStrings = <String>[];
  bool muted = false;
  late RtcEngine _engine;

  @override
  void dispose() {
    // clear users
    _users.clear();
    _dispose();
    super.dispose();
  }

  Future<void> _dispose() async {
    // destroy sdk
    // await _engine.leaveChannel();
    // await _engine.destroy();
  }

  @override
  void initState() {
    super.initState();
    // initialize agora sdk
    initialize();
  }

  Future<void> initialize() async {
    if (appId.isEmpty) {
      setState(() {
        _infoStrings.add(
          'APP_ID missing, please provide your APP_ID in settings.dart',
        );
        _infoStrings.add('Agora Engine is not starting');
      });
      return;
    }

    await _initAgoraRtcEngine();
    // _addAgoraEventHandlers();
    VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
    // configuration.dimensions = VideoDimensions(width: 1920, height: 1080);
    await _engine.setVideoEncoderConfiguration(configuration);
    // await _engine.joinChannel(token: token, channelId: widget.channelName!, uid: 0, options: null);
  }

  /// Create agora sdk instance and initialize
  Future<void> _initAgoraRtcEngine() async {
    // _engine = await RtcEngine.create(appId);
    // await _engine.enableVideo();
    // await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    // await _engine.setClientRole(widget.role!);
  }

  /// Add agora event handlers
  // void _addAgoraEventHandlers() {
  //   _engine.setEventHandler(RtcEngineEventHandler(error: (code) {
  //     setState(() {
  //       final info = 'onError: $code';
  //       _infoStrings.add(info);
  //     });
  //   }, joinChannelSuccess: (channel, uid, elapsed) {
  //     setState(() {
  //       final info = 'onJoinChannel: $channel, uid: $uid';
  //       _infoStrings.add(info);
  //     });
  //   }, leaveChannel: (stats) {
  //     setState(() {
  //       _infoStrings.add('onLeaveChannel');
  //       _users.clear();
  //     });
  //   }, userJoined: (uid, elapsed) {
  //     setState(() {
  //       final info = 'userJoined: $uid';
  //       _infoStrings.add(info);
  //       _users.add(uid);
  //     });
  //   }, userOffline: (uid, elapsed) {
  //     setState(() {
  //       final info = 'userOffline: $uid';
  //       _infoStrings.add(info);
  //       _users.remove(uid);
  //     });
  //   }, firstRemoteVideoFrame: (uid, width, height, elapsed) {
  //     setState(() {
  //       final info = 'firstRemoteVideo: $uid ${width}x $height';
  //       _infoStrings.add(info);
  //     });
  //   }));
  // }

  /// Helper function to get list of native views
  List<Widget> _getRenderViews() {
    final List<StatefulWidget> list = [];
    // if (widget.role == ClientRole.Broadcaster) {
    //   list.add(RtcLocalView.SurfaceView());
    // }
    // _users.forEach((int uid) => list.add(
    //     RtcRemoteView.SurfaceView(channelId: widget.channelName!, uid: uid)));
    return list;
  }

  /// Video view wrapper
  Widget _videoView(view) {
    return Expanded(child: Container(child: view));
  }

  /// Video view row wrapper
  Widget _expandedVideoRow(List<Widget> views) {
    final wrappedViews = views.map<Widget>(_videoView).toList();
    return Expanded(
      child: Row(
        children: wrappedViews,
      ),
    );
  }

  /// Video layout wrapper
  Widget _viewRows() {
    final views = _getRenderViews();
    switch (views.length) {
      case 1:
        return Container(
            child: Column(
          children: <Widget>[_videoView(views[0])],
        ));
      case 2:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoRow([views[0]]),
            _expandedVideoRow([views[1]])
          ],
        ));
      case 3:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoRow(views.sublist(0, 2)),
            _expandedVideoRow(views.sublist(2, 3))
          ],
        ));
      case 4:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoRow(views.sublist(0, 2)),
            _expandedVideoRow(views.sublist(2, 4))
          ],
        ));
      default:
    }
    return Container();
  }

  /// Toolbar layout
  Widget _toolbar() {
    // if (widget.role == ClientRole.Audience) 
    // return Container();
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: _onToggleMute,
            child: Icon(
              muted ? Icons.mic_off : Icons.mic,
              color: muted ? Colors.white : Colors.blueAccent,
              size: 20.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: muted ? Colors.blueAccent : Colors.white,
            padding: const EdgeInsets.all(12.0),
          ),
          RawMaterialButton(
            onPressed: () => _onCallEnd(context),
            child: Icon(
              Icons.call_end,
              color: Colors.white,
              size: 35.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.redAccent,
            padding: const EdgeInsets.all(15.0),
          ),
          RawMaterialButton(
            onPressed: _onSwitchCamera,
            child: Icon(
              Icons.switch_camera,
              color: Colors.blueAccent,
              size: 20.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(12.0),
          )
        ],
      ),
    );
  }

  /// Info panel to show logs
  Widget _panel() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48),
      alignment: Alignment.bottomCenter,
      child: FractionallySizedBox(
        heightFactor: 0.5,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 48),
          child: ListView.builder(
            reverse: true,
            itemCount: _infoStrings.length,
            itemBuilder: (BuildContext context, int index) {
              if (_infoStrings.isEmpty) {
                return Text(
                    "null"); // return type can't be null, a widget was required
              }
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          _infoStrings[index],
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _onCallEnd(BuildContext context) {
    Navigator.pop(context);
  }

  void _onToggleMute() {
    setState(() {
      muted = !muted;
    });
    // _engine.muteLocalAudioStream(muted);
  }

  void _onSwitchCamera() {
    // _engine.switchCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primarydarkColor,
        title: Text('Live'),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: <Widget>[
            _viewRows(),
            _panel(),
            _toolbar(),
          ],
        ),
      ),
    );
  }
}


// import 'dart:typed_data';
// import 'package:bano_live/presentation/resources/strings_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
// import 'package:agora_rtc_engine/media_recorder.dart' as media_recorder;
// // import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
// // import 'package:agora_rtc_engine/rtc_render_view.dart' as RtcRemoteView;

// class BroadcastPage extends StatefulWidget {
//   final String? channelName;
//   final bool? isBroadcaster;

//   const BroadcastPage({Key? key, this.channelName, this.isBroadcaster})
//       : super(key: key);

//   @override
//   _BroadcastPageState createState() => _BroadcastPageState();
// }

// class _BroadcastPageState extends State<BroadcastPage> {
//   final _users = <int>[];
//   // RtcEngine? _engine;
//   late RtcEngine _engine;
//   bool muted = false;
//   int? streamId;

//   @override
//   void dispose() {
//     // clear users
//     _users.clear();
//     // destroy sdk and leave channel
//     //_engine.disableVideo();
//     //_engine.leaveChannel();
//     _engine.disableVideo();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     super.initState();
//     // initialize agora sdk
//     initializeAgora();
//   }

//   Future<void> initializeAgora() async {
//     // retrieve permissions
//     await [Permission.microphone, Permission.camera].request();
//     //create the engine
//     _engine = createAgoraRtcEngine();

//     //--------------1 Main Function- Calling ----
//     await _initAgoraRtcEngine();

//     if (widget.isBroadcaster ?? false)
//       //streamId = await _engine.createDataStream(false, false);
//       streamId = await _engine.createDataStream(DataStreamConfig(
//         syncWithAudio: false,
//         ordered: false,
//       ));
//     //--------------2 Main Function- Calling  AgoraEventHandler ----
// /*
//     _engine.registerEventHandler(
//       RtcEngineEventHandler(
//       onJoinChannelSuccess: (channel, uid, elapsed) {
//         setState(() {
//           print('onJoinChannel: $channel, uid: $uid');
//         });
//       },
//       leaveChannel: (stats) {
//         setState(() {
//           print('onLeaveChannel');
//           _users.clear();
//         });
//       },
//       userJoined: (uid, elapsed) {
//         setState(() {
//           print('userJoined: $uid');

//           _users.add(uid);
//         });
//       },
//       userOffline: (uid, elapsed) {
//         setState(() {
//           print('userOffline: $uid');
//           _users.remove(uid);
//         });
//       },
//       streamMessage: (_, __, message) {
//         final String info = "here is the message $message";
//         print(info);
//       },
//       streamMessageError: (_, __, error, ___, ____) {
//         final String info = "here is the error $error";
//         print(info);
//       },
//     ));
//     */
//     _engine.registerEventHandler(
//       RtcEngineEventHandler(
//         onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
//           debugPrint("local user ${connection.localUid} joined");
//           setState(() {
//             // _localUserJoined = true;
//             print(
//                 'onJoinChannel: ${connection.channelId}, uid: ${connection.localUid}');
//           });
//         },
//         onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
//           debugPrint("remote user $remoteUid joined");
//           setState(() {
//             // _remoteUid = remoteUid;
//             _users.add(remoteUid);
//           });
//         },
//         onLeaveChannel: (RtcConnection connection, state) {
//           setState(() {
//             print('onLeaveChannel');
//             _users.clear();
//           });
//         },
//         onUserOffline: (RtcConnection connection, int remoteUid,
//             UserOfflineReasonType reason) {
//           debugPrint("remote user $remoteUid left channel");
//           setState(() {
//             _users.remove(remoteUid);
//             // _remoteUid = null;
//           });
//         },
//         // onStreamMessage: (RtcConnection connection,_,__, __,__, message) {
//         //   final String info = "here is the message $message";
//         //   print(info);
//         // },
//         // onStreamMessageError: (_, __, error, ___, ____) {
//         //   final String info = "here is the error $error";
//         //   print(info);
//         // },
//         onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
//           debugPrint(
//               '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
//         },
//       ),
//     );
// //--------------3 Main Function- Calling  joinChannel ----
//     // await _engine!.joinChannel(null, widget.channelName, null, 0);
//     await _engine.joinChannel(
//         token: AppStrings.token,
//         channelId: AppStrings.appId,
//         uid: 0,
//         options: ChannelMediaOptions(
//              channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,//_channelProfileType,
//              clientRoleType: ClientRoleType.clientRoleBroadcaster,
//             ));
//   }

// //--------------1 Main Function- Implementation----
//   Future<void> _initAgoraRtcEngine() async {
//     //  _engine = await RtcEngine.createWithConfig(RtcEngineConfig(appId));

//     await _engine.initialize(const RtcEngineContext(
//       appId: AppStrings.appId,
//       channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
//     ));
//     await _engine.enableVideo();
//     await _engine.startPreview();
//     //await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
//     if (widget.isBroadcaster ?? false) {
//       // await _engine.setClientRole(ClientRole.Broadcaster);
//       await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
//     } else {
//       // await _engine.setClientRole(ClientRole.Audience);
//       await _engine.setClientRole(role: ClientRoleType.clientRoleAudience);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Stack(
//           children: <Widget>[
//             _broadcastView(),
//             _toolbar(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _toolbar() {
//     return widget.isBroadcaster!
//         ? Container(
//             alignment: Alignment.bottomCenter,
//             padding: const EdgeInsets.symmetric(vertical: 48),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 RawMaterialButton(
//                   onPressed: _onToggleMute,
//                   child: Icon(
//                     muted ? Icons.mic_off : Icons.mic,
//                     color: muted ? Colors.white : Colors.blueAccent,
//                     size: 20.0,
//                   ),
//                   shape: CircleBorder(),
//                   elevation: 2.0,
//                   fillColor: muted ? Colors.blueAccent : Colors.white,
//                   padding: const EdgeInsets.all(12.0),
//                 ),
//                 RawMaterialButton(
//                   onPressed: () => _onCallEnd(context),
//                   child: Icon(
//                     Icons.call_end,
//                     color: Colors.white,
//                     size: 35.0,
//                   ),
//                   shape: CircleBorder(),
//                   elevation: 2.0,
//                   fillColor: Colors.redAccent,
//                   padding: const EdgeInsets.all(15.0),
//                 ),
//                 RawMaterialButton(
//                   onPressed: _onSwitchCamera,
//                   child: Icon(
//                     Icons.switch_camera,
//                     color: Colors.blueAccent,
//                     size: 20.0,
//                   ),
//                   shape: CircleBorder(),
//                   elevation: 2.0,
//                   fillColor: Colors.white,
//                   padding: const EdgeInsets.all(12.0),
//                 ),
//               ],
//             ),
//           )
//         : Container();
//   }

//   /// Helper function to get list of native views
//   List<Widget> _getRenderViews() {
//     final List<StatefulWidget> list = [];
//     if (widget.isBroadcaster ?? false) {
//       // list.add(RtcLocalView.SurfaceView());
//       // list.add(RtcLocalView.SurfaceView());
//     }
//     // _users.forEach((int uid) => list.add(RtcRemoteView.SurfaceView(uid: uid)));
//     return list;
//   }

//   /// Video view row wrapper
//   Widget _expandedVideoView(List<Widget> views) {
//     final wrappedViews = views
//         .map<Widget>((view) => Expanded(child: Container(child: view)))
//         .toList();
//     return Expanded(
//       child: Row(
//         children: wrappedViews,
//       ),
//     );
//   }

//   /// Video layout wrapper
//   Widget _broadcastView() {
//     final views = _getRenderViews();
//     switch (views.length) {
//       case 1:
//         return Container(
//             child: Column(
//           children: <Widget>[
//             _expandedVideoView([views[0]])
//           ],
//         ));
//       case 2:
//         return Container(
//             child: Column(
//           children: <Widget>[
//             _expandedVideoView([views[0]]),
//             _expandedVideoView([views[1]])
//           ],
//         ));
//       case 3:
//         return Container(
//             child: Column(
//           children: <Widget>[
//             _expandedVideoView(views.sublist(0, 2)),
//             _expandedVideoView(views.sublist(2, 3))
//           ],
//         ));
//       case 4:
//         return Container(
//             child: Column(
//           children: <Widget>[
//             _expandedVideoView(views.sublist(0, 2)),
//             _expandedVideoView(views.sublist(2, 4))
//           ],
//         ));
//       default:
//     }
//     return Container();
//   }

//   void _onCallEnd(BuildContext context) {
//     Navigator.pop(context);
//   }

//   void _onToggleMute() {
//     setState(() {
//       muted = !muted;
//     });
//     _engine.muteLocalAudioStream(muted);
//   }

//   void _onSwitchCamera() {
//     if (streamId != null)
//       // _engine.sendStreamMessage( streamId:  streamId!, data:"mute user blet",length: 10);
//       _engine.sendStreamMessage(
//           streamId: streamId!,
//           data: convertStringToUint8List("mute user blet"),
//           length: 15);
//     //_engine.switchCamera();
//   }
// }

// Uint8List convertStringToUint8List(String str) {
//   final List<int> codeUnits = str.codeUnits;
//   final Uint8List unit8List = Uint8List.fromList(codeUnits);

//   return unit8List;
// }
