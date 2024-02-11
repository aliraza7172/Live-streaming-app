import 'package:stream_up_live/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Customdivider extends StatelessWidget {
  double? thikness;
  Customdivider({Key? key, this.thikness}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thikness ?? 0.0,
      color: ColorManager.primarydarkdarkColor,
    );
  }
}
