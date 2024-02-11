import 'package:stream_up_live/model/notification_user_model.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/widgets/notification_list.dart';
import 'package:stream_up_live/widgets/toggle_button_list.dart';
import 'package:flutter/material.dart';
import '../../widgets/index_widget.dart';
import '../resources/index_manager.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  int selectedid = 0;
  List _categories = ["All", "Live Videos", "Posts"];
  List FresherUserList = [
    ImageAssets.streamUser1Image,
    ImageAssets.streamUser2Image,
    ImageAssets.streamUser3Image,
    ImageAssets.streamUser4Image,
    ImageAssets.streamUser5Image,
    ImageAssets.streamUser6Image,
    ImageAssets.streamUser7Image,
    ImageAssets.streamUser8Image,
    ImageAssets.streamUser9Image,
    ImageAssets.streamUser10Image,
  ];
  List<NotificationListModel> _notificationUserList = [
    NotificationListModel(
        name: "James Olivia Was Live",
        ImagePath: ImageAssets.streamUser1Image,
        onlineTime: "2m ago"),
    NotificationListModel(
        name: "John Doe Create an Post",
        ImagePath: ImageAssets.streamUser2Image,
        onlineTime: "2m ago"),
    NotificationListModel(
        name: "James Olivia Was Live",
        ImagePath: ImageAssets.streamUser3Image,
        onlineTime: "2m ago"),
    NotificationListModel(
        name: "John Doe Create an Post",
        ImagePath: ImageAssets.streamUser4Image,
        onlineTime: "2m ago"),
    NotificationListModel(
        name: "James Olivia Was Live",
        ImagePath: ImageAssets.streamUser5Image,
        onlineTime: "2m ago"),
    NotificationListModel(
        name: "John Doe Create an Post",
        ImagePath: ImageAssets.streamUser6Image,
        onlineTime: "2m ago"),
    NotificationListModel(
        name: "James Olivia Was Live",
        ImagePath: ImageAssets.streamUser7Image,
        onlineTime: "2m ago"),
    NotificationListModel(
        name: "John Doe Create an Post",
        ImagePath: ImageAssets.streamUser8Image,
        onlineTime: "2m ago"),
    NotificationListModel(
        name: "James Olivia Was Live",
        ImagePath: ImageAssets.streamUser9Image,
        onlineTime: "2m ago"),
    NotificationListModel(
        name: "John Doe Create an Post",
        ImagePath: ImageAssets.streamUser10Image,
        onlineTime: "2m ago"),
    NotificationListModel(
        name: "James Olivia Was Live",
        ImagePath: ImageAssets.streamUser1Image,
        onlineTime: "2m ago"),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(height: 20.vs),
        AppBarSearchField(),
        heading(AppStrings.notification),
        Categories(),
        SizedBox(height: 5.0),
        Expanded(child: notificationlist()),
      ],
    );
  }

  Widget notificationlist() {
    return ListView.separated(
        padding: EdgeInsets.zero,
        separatorBuilder: (context, index) => Divider(color: ColorManager.grey),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ConversationList(
            name: _notificationUserList[index].name,
            messageText: _notificationUserList[index].onlineTime,
            imageUrl: _notificationUserList[index].ImagePath,
            isMessageRead: index.isEven ? true : false,
          );
        });
  }

  Widget heading(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
      child: Text(text,
          style: getsemiboldStyle(
              color: ColorManager.white, fontSize: AppSize.s17.mv)),
    );
  }

  Widget Categories() {
    return ToggleButtonList(
      selected: selectedid,
      callback: (int index) {
        setState(() {
          selectedid = index;
        });
        //pageController.jumpToPage(index);
      },
      categories: _categories,
    );
  }
}
