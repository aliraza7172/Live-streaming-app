import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#E92F24");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#737373");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color blue = HexColor.fromHex("#375B95");
  static Color darkblue = HexColor.fromHex("#27B0FF");
  static Color blackBorder = HexColor.fromHex("#000000");
  static Color lightblue = HexColor.fromHex("#3E95E5");
  static Color lightpink = HexColor.fromHex("#FBD5D4");
  static Color gradientColor = HexColor.fromHex("#E92F24");
  static Color primaryOpacity70 = HexColor.fromHex("#B3ED9728");
  static Color googlebtn = HexColor.fromHex("#EE695D");
  static Color fbbtn = HexColor.fromHex("#157DC3");

//------------------------------------darkThemeColor---------

  static Color primarydarkColor = HexColor.fromHex("#535C73");
  static Color greydarkThemeColor = Colors.grey.shade600;
  static Color hinttextdarkColor = HexColor.fromHex("#C6C6C6");
  //static Color secondarydarkColor = HexColor.fromHex("#000000");
  static Color secondarydarkColor = HexColor.fromHex("#F5F5DC");
  static Color profiledarkColor = HexColor.fromHex("#575F76");
  static Color primarydarkdarkColor = HexColor.fromHex("#303749");
  static Color navbardarkColor = HexColor.fromHex("#20242F");
  static Color subtitleTextColor = HexColor.fromHex("#AEAECE");
  static Color chatInputFiledColor = HexColor.fromHex("#4A5469");

  // new colors
  static Color darkPrimary = HexColor.fromHex("#d17d11");
  static Color grey1 = HexColor.fromHex("#EFEFEF");
  static Color yellow = HexColor.fromHex("#FE9E00");
  static Color green = HexColor.fromHex("#1AB846");
  static Color grey3 = HexColor.fromHex("#9293B0");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color blueSolid = HexColor.fromHex("#259DE2");
  static Color blueStroke = HexColor.fromHex("#55BCF6");
  static Color redStroke = HexColor.fromHex("#FF6C63");
  static Color turquoise = HexColor.fromHex("#1AA494");
  static Color lavender = HexColor.fromHex("#8C89F8");
  static Color jamni = HexColor.fromHex("#7f00ff");
  static Color pink = HexColor.fromHex("#E9249A");
  static Color btnbgColor = HexColor.fromHex("#F2F3F5");
  static Color livebgColor = HexColor.fromHex("#061721");
  static Color turquoiseStroke = HexColor.fromHex("#36CEBC");
  static Color greylight = HexColor.fromHex("#F3EFEF");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static Color red = HexColor.fromHex("#F74239");
  static Color error = HexColor.fromHex("#e61f34"); // red color

  //profileGridviewBuildercolor
  static Color topupColor = HexColor.fromHex("#ED2C6F");
  static Color earningColor = HexColor.fromHex("#F2971A");
  static Color mytaskColor = HexColor.fromHex("#54AFF4");
  static Color vipColor = HexColor.fromHex("#8068F8");
  static Color storeColor = HexColor.fromHex("#E629BD");
  static Color orangeColor = HexColor.fromHex("#FFAE01");
  static Color orangedarkColor = HexColor.fromHex("#F27423");
  static Color mylavelColor = HexColor.fromHex("#7F7BEC");
  static Color mybadgeColor = HexColor.fromHex("#F7961D");
  static Color helpColor = HexColor.fromHex("#7E67F6");
  static Color editProfileColor = HexColor.fromHex("#5BB2F9");
  static Color myinvitesColor = HexColor.fromHex("#34F1E2");
  static Color settingsColor = HexColor.fromHex("#51E97A");
  static Color lightWhite = HexColor.fromHex("#AEAECE");
  static Color buttonRed = HexColor.fromHex("#EB372C");
  //------latest colors --------
  static Color kColorDarkGrey = Color.fromRGBO(83, 92, 115, 1);
  static Color kColorDarkestGrey = Color.fromRGBO(48, 55, 73, 1);
  static Color transparent = Colors.transparent;
  static Color transparentLight = Color.fromARGB(82, 0, 0, 0);
  static Color skyBlue = Color.fromARGB(255, 6, 214, 158);
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
