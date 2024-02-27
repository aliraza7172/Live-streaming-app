import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import '../../utils/app_constants.dart';


class LivePage extends StatelessWidget {
  final String liveID;
  final bool isHost;

  const LivePage({Key? key, required this.liveID, this.isHost = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID: zegoAppId, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign: zegoAppSign, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: 'user_id11',
        userName: 'user_name22',
        liveID: liveID,
        config: isHost
            ? ZegoUIKitPrebuiltLiveStreamingConfig.host(
          plugins: [ZegoUIKitSignalingPlugin()],
        )
            : ZegoUIKitPrebuiltLiveStreamingConfig.audience(
          plugins: [ZegoUIKitSignalingPlugin()],
        ),
      ),
    );
  }
}