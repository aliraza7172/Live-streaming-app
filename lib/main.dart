import 'package:flutter/material.dart';
import 'package:stream_up_live/get_di.dart';
import 'app/app.dart';
import 'package:flutter/services.dart';

//late List<CameraDescription> _cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await init();
  runApp(MyApp());
}
