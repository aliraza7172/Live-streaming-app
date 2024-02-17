import 'package:flutter/material.dart';
import 'theme_helper.dart';
import '../utils/size_utils.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMedium15 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 15.fSize,
      );
  static get bodyMediumCyanA400 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.cyanA400,
      );
  static get bodyMediumCyanA40014 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.cyanA400,
        fontSize: 14.fSize,
      );
  static get bodyMediumCyanA40015 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.cyanA400,
        fontSize: 15.fSize,
      );
  static get bodyMediumLimeA700 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.limeA700,
        fontSize: 14.fSize,
      );
  static get bodySmall11 => theme.textTheme.bodySmall!.copyWith(
        fontSize: 11.fSize,
      );
  static get bodySmall12 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.tealA700,
    fontSize: 12.fSize,
      );
  static get bodyMediumTealA700 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.tealA700,
    fontSize: 14.fSize,
  );
  static get bodyMedium14 => theme.textTheme.bodyMedium!.copyWith(
    fontSize: 14.fSize,
  );

  static get bodySmallWhiteA70012 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.whiteA700,
    fontSize: 12.fSize,
  );
  static get bodySmallWhiteA700 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.whiteA700,
    fontSize: 10.fSize,
  );
  static get bodySmallWhiteA7009 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.whiteA700,
    fontSize: 9.fSize,
  );

  // Poppins text style
  static get poppinsRedA700 => TextStyle(
        color: appTheme.redA700,
        fontSize: 7.fSize,
        fontWeight: FontWeight.w500,
      ).poppins;
  static get poppinsWhiteA700 => TextStyle(
        color: appTheme.whiteA700,
        fontSize: 7.fSize,
        fontWeight: FontWeight.w500,
      ).poppins;
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
