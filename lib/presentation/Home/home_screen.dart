// ignore_for_file: deprecated_member_use

import 'package:stream_up_live/presentation/Home/deshboard_screen.dart';
import 'package:stream_up_live/presentation/Home/message_screen.dart';
import 'package:stream_up_live/presentation/Home/notification_screen.dart';
import 'package:stream_up_live/presentation/Home/profile_screen.dart';
import 'package:stream_up_live/presentation/Home/streams_screen.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/presentation/resources/assets_manager.dart';
import 'package:stream_up_live/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _pagecontroller;
  var _currentIndex = 0;
  @override
  void initState() {
    _pagecontroller = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondarydarkColor,
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: _pagecontroller,
          onPageChanged: (val) {
            setState(() {
              _currentIndex = val;
            });
          },
          children: <Widget>[
            StreamsView(),
            DeshboardView(),
            MessagesView(),
            NotificationView(),
            ProfileView(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: ColorManager.navbardarkColor,
        selectedItemColor: ColorManager.primary,
        showUnselectedLabels: true,
        selectedFontSize: 0.0,
        onTap: (value) {
          setState(() => _currentIndex = value);
          _pagecontroller.jumpToPage(value);
        },
        items: [
          bottomNavbaritem(
              title: "Streams",
              IconName: ImageAssets.streamIcon,
              currentindex: 0),
          bottomNavbaritem(
              title: "Home", IconName: ImageAssets.homeIcon, currentindex:1),
          bottomNavbaritem(
              title: "Messages",
              IconName: ImageAssets.MessagesIcon,
              currentindex: 2),
          bottomNavbaritem(
              title: "Notifications",
              IconName: ImageAssets.NotificationsIcon,
              currentindex: 3),
          bottomNavbaritem(
              title: "Profiles",
              IconName: ImageAssets.profileIcon,
              currentindex: 4),
        ],
      ),
    );
  }

  BottomNavigationBarItem bottomNavbaritem(
      {String? title, String? IconName, int? currentindex}) {
    return BottomNavigationBarItem(
      label: "",
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 0.0),
        child: Column(
          children: [
            SvgPicture.asset(
              IconName!,
              color: currentindex == _currentIndex
                  ? ColorManager.primary
                  : ColorManager.greydarkThemeColor,
            ),
            SizedBox(height: 5.0),
            Text(
              title ?? "",
              style: TextStyle(
                fontSize: 10.mv,
                color: currentindex == _currentIndex
                    ? ColorManager.primary
                    : ColorManager.greydarkThemeColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
