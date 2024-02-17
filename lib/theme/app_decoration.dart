import 'package:flutter/material.dart';
import '../utils/size_utils.dart';
import 'theme_helper.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlack => BoxDecoration(
        color: appTheme.black900.withOpacity(0.15),
      );
  static BoxDecoration get fillBlack900 => BoxDecoration(
        color: appTheme.black900.withOpacity(0.3),
      );
  static BoxDecoration get fillDeepPurpleA => BoxDecoration(
        color: appTheme.deepPurpleA700,
      );
  static BoxDecoration get fillTealA => BoxDecoration(
        color: appTheme.tealA700,
      );

  // Outline decorations
  static BoxDecoration get outlineTealA => BoxDecoration(
        color: appTheme.black900.withOpacity(0.3),
        border: Border.all(
          color: appTheme.tealA700,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineWhiteA => BoxDecoration(
        color: appTheme.gray400,
        border: Border.all(
          color: appTheme.whiteA700,
          width: 1.h,
        ),
      );

  static BoxDecoration get outlineIndigoA => BoxDecoration(
    color: appTheme.black90033.withOpacity(0.15),
    border: Border.all(
      color: appTheme.indigoA700,
      width: 1.h,
    ),
  );
  static BoxDecoration get outlinePurpleA => BoxDecoration(
    color: appTheme.purpleA100.withOpacity(0.3),
    border: Border.all(
      color: appTheme.purpleA100,
      width: 1.h,
    ),
  );

  // Gradient decorations
  static BoxDecoration get gradientLightGreenAToPinkA => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(0, 0),
      end: Alignment(1, 1),
      colors: [
        appTheme.lightGreenA200,
        appTheme.pinkA400,
      ],
    ),
  );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder11 => BorderRadius.circular(
        11.h,
      );
  static BorderRadius get circleBorder16 => BorderRadius.circular(
        16.h,
      );
  static BorderRadius get circleBorder5 => BorderRadius.circular(
        5.h,
      );

  // Rounded borders
  static BorderRadius get roundedBorder8 => BorderRadius.circular(
        8.h,
      );

  // Rounded borders
  static BorderRadius get roundedBorder11 => BorderRadius.circular(
    11.h,
  );

  static BorderRadius get customBorderLR15 => BorderRadius.horizontal(
    right: Radius.circular(15.h),
  );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
