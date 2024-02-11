// ignore_for_file: deprecated_member_use

import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/custom_divider.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class FAQsScreen extends StatefulWidget {
  const FAQsScreen({super.key});

  @override
  State<FAQsScreen> createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  List<String> title = [
    "Account Basics",
    "Starting a Live Show",
    "Beans, Coins, Gifts & Cash Out",
    "Levek",
    "My Check-In",
    "Top Up",
    "Shop",
    "Beans Bag",
  ];
  // List choicsRoute = [
  //   Routes.BlockedListScreenViewRoute,
  //   Routes.PrivacyViewRoute,
  //   Routes.BlockedListScreenViewRoute,
  //   Routes.PrivacyViewRoute,
  //   Routes.BlockedListScreenViewRoute,
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondarydarkColor,
      appBar: AppBar(
        backgroundColor: ColorManager.primarydarkdarkColor,
        centerTitle: false,
        titleSpacing: 0,
        elevation: 1.0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(
              ImageAssets.arrowbackIcon,
              color: ColorManager.white,
            ),
          ),
        ),
        title: Text(
          "FAQs",
          style: getsemiboldStyle(
              color: ColorManager.white, fontSize: AppSize.s16.mv),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 200,
            width: AppSize.sizeWidth(context),
            // color: Colors.yellow,
            decoration: BoxDecoration(
              //borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken),
                fit: BoxFit.cover,
                image: AssetImage(ImageAssets.profilebackgroundImage),
              ),
            ),
          ),
          customeListTile(
              title: "stream_up_live",
              onTap: () {},
              trailing: ImageAssets.downwardIcon),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: customeText(
                title:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
                color: ColorManager.grey3,
                fontSize: 12.mv),
          ),
          Customdivider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: title.length,
              separatorBuilder: (context, index) => Divider(
                color: ColorManager.grey,
              ),
              itemBuilder: (context, index) => customeListTile(
                  title: title[index],
                  onTap: () {},
                  trailing: ImageAssets.forwardIcon),
            ),
          ),
        ]),
      ),
    );
  }

  Widget customeListTile(
      {String? title, void Function()? onTap, String? trailing}) {
    return ListTile(
      title: Text(title ?? "",
          style:
              getRegularStyle(color: ColorManager.whiteColor, fontSize: 16.mv)),
      trailing: SvgPicture.asset(
        trailing!,
        color: ColorManager.white,
      ),
      onTap: onTap,
    );
  }

  Widget customeText({String? title, Color? color, double? fontSize}) {
    return Text(title!,
        style: getRegularStyle(color: color!, fontSize: fontSize!));
  }
}
