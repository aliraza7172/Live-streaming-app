import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:io';

import 'package:zego_zimkit/zego_zimkit.dart';

import 'data/Live_Streaming/zego_info.dart';
import 'utils/app_constants.dart';

Future<void> init() async {
  // Core
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyClOC9IYLkMqSWxLRSe4mcjPZSobxF6qG4",
              appId: "1:522450315379:android:61352657b7af634beba206",
              messagingSenderId: "522450315379",
              projectId: "stream-up-live",
              storageBucket: "stream-up-live.appspot.com"))
      : Firebase.initializeApp();
  // initialize ZimKit
  await ZIMKit()
      .init(appID: zegoAppId, appSign: zegoAppSign);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await GetStorage.init();
}
