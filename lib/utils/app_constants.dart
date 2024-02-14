// Dart imports:
import 'dart:math';

/// Note that the userID needs to be globally unique,
final String localUserID = Random().nextInt(100000).toString();
final int zegoAppId = 985318635;
final String zegoAppSign = "12d83c174d0ab35ccb81a7530e7db1b97d78e62f49b6a4ff2d2a3babd6ca4c66";
enum LayoutMode {
  defaultLayout,
  full,
  horizontal,
  vertical,
  hostTopCenter,
  hostCenter,
  fourPeoples,
}

extension LayoutModeExtension on LayoutMode {
  String get text {
    final mapValues = {
      LayoutMode.defaultLayout: 'default',
      LayoutMode.full: 'full',
      LayoutMode.horizontal: 'horizontal',
      LayoutMode.vertical: 'vertical',
      LayoutMode.hostTopCenter: 'host top center',
      LayoutMode.hostCenter: 'host center',
      LayoutMode.fourPeoples: 'four peoples',
    };

    return mapValues[this]!;
  }
}