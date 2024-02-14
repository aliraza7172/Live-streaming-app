import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:stream_up_live/controller/messanger_controller.dart';
import 'package:stream_up_live/data/model/body/messages_model.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/presentation/chat/message_screen.dart';

import '../../widgets/index_widget.dart';
import '../resources/index_manager.dart';

class MessagesView extends StatefulWidget {
  const MessagesView({Key? key}) : super(key: key);

  @override
  State<MessagesView> createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessangerController>(
        init: MessangerController(),
        builder: (_) {
          return Column(
            children: [
              AppBarSearchField(),
              /*--------------------EditPic--------------------------------------- */
              header(),
              Divider(color: ColorManager.grey),
              Flexible(
                child: ListView.separated(
                    padding: EdgeInsets.zero,
                    separatorBuilder: ((context, index) => Divider(
                          color: ColorManager.grey,
                        )),
                    itemCount: _.messagesModel.data!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            //InnerChat
                            _.singleChat = _.messagesModel.data![index];
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InnerChat()));
                          },
                          child: chatUser(_.messagesModel.data![index]));
                    }),
              )
            ],
          );
        });
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.chat,
            style: getsemiboldStyle(
                color: ColorManager.white, fontSize: AppSize.s18.mv),
          ),
          Row(
            children: [
              SvgPicture.asset(ImageAssets.chat2UserIcon,color: ColorManager.whiteColor,),
              SizedBox(width: 10.0),
              SvgPicture.asset(ImageAssets.chatsettingIcon,color: ColorManager.whiteColor),
              SizedBox(width: 10.0),
            ],
          )
        ],
      ),
    );
  }

  Widget chatUser(MessagesData chatData) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.0,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: AppStrings.imgBaseUrl + "/" + chatData.userImage,
                placeholder: (context, url) => const Center(
                    child: CircleAvatar(
                        radius: 20, child: CircularProgressIndicator())),
                errorWidget: (context, url, error) => Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    //borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      colorFilter:
                          ColorFilter.mode(Colors.black12, BlendMode.darken),
                      fit: BoxFit.cover,
                      image: AssetImage(ImageAssets.background_defaultImage),
                    ),
                  ),
                ),
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover, image: imageProvider)),
                ),
              ),
            ),
            SizedBox(width: 5.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chatData.userFullName.toString(),
                  style: TextStyle(
                      color: ColorManager.white,
                      fontSize: 12.mv,
                      fontWeight: FontWeightManager.bold),
                ),
                Text(
                  chatData.conversationText.toString(),
                  style: TextStyle(
                      fontSize: 10.mv, color: ColorManager.subtitleTextColor),
                ),
                Container(
                  //color: ColorManager.greylight,
                  width: AppSize.sizeWidth(context) / 1.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "2m ago",
                        style: TextStyle(
                            fontSize: 10.mv, color: ColorManager.grey),
                      ),
                      //Spacer(),
                      Row(
                        children: [
                          Text("${chatData.conversationReadStatus}...",
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w300,
                                  color:
                                      //msgStatus[index - 1] == 'Read...'
                                      //   ?
                                      ColorManager.primary
                                  // : Colors.grey
                                  )),
                          Icon(Icons.done_all,
                              size: 15,
                              color:
                                  //  msgStatus[index - 1] == 'Read...'
                                  //     ?
                                  ColorManager.primary
                              //: Colors.grey,
                              )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
