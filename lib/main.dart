import 'package:flutter/material.dart';
import 'package:stream_up_live/get_di.dart';
import 'app/app.dart';

//late List<CameraDescription> _cameras;
void main() async {
  await init();
  runApp(MyApp());
}
