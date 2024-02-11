
// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'dart:ui';

import 'package:responsive_sizer/responsive_sizer.dart';

double statusbarHeight = MediaQueryData.fromView(window).padding.top;
bool isTablet = 100.w >= 755;

int modelDeviceWidth = isTablet ? 768 : 375;
int modelDeviceHeight = isTablet ? 1024 : 812;

extension Sizer on num {
  // moderated value
  double get mv => ((this / modelDeviceWidth) * 100).w;

  // vertical scale
  double get vs => ((this / modelDeviceHeight) * 100).h;

  // horizontal scale
  double get hs => ((this / modelDeviceWidth) * 100).w;

  // get device width
  double get vw => double.parse(this.toString()).w;

 // get device height
  double get vh => double.parse(this.toString()).h;
}
