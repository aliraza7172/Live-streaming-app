// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stream_up_live/controller/messanger_controller.dart';
import 'package:stream_up_live/data/model/body/messages_model.dart';
import 'package:stream_up_live/widgets/custom_snackbar.dart';
import 'package:stream_up_live/widgets/inner_chat_messge.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/index_manager.dart';

class InnerChat extends StatefulWidget {
  @override
  _InnerChatState createState() => _InnerChatState();
}

class _InnerChatState extends State<InnerChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBarForChatScreen(context),
      backgroundColor: ColorManager.secondarydarkColor,
      //  resizeToAvoidBottomInset: true,
      body: GetBuilder<MessangerController>(
        // init: MessangerController(),
        builder: (_){
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //---------------------------------------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        InkWell(
                          onTap: () => Navigator.pop(context),
                          child: SvgPicture.asset(
                            ImageAssets.arrowbackIcon,
                            color: ColorManager.white,
                          ),
                        ),
                        SizedBox(width: 20.0),
                        Stack(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              // decoration: BoxDecoration(
                              //   //borderRadius: BorderRadius.circular(10.0),
                              //   shape: BoxShape.circle,
                              //   image: DecorationImage(
                              //     fit: BoxFit.cover,
                              //     image: AssetImage(ImageAssets.newUser2Image),
                              //   ),
                              // ),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: AppStrings.imgBaseUrl+"/"+_.singleChat.userImage,
                                placeholder: (context, url) =>
                                const Center(
                                    child: CircleAvatar(
                                        radius: 20,
                                        child:
                                        CircularProgressIndicator())),
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
                                      image:
                                      DecorationImage(fit: BoxFit.cover, image: imageProvider)),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0.0,
                              right: 0.0,
                              child: Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 16),
                        Container(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                _.singleChat.userFullName.toString(),
                                style: TextStyle(
                                    fontSize: 16, color: ColorManager.white),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "Online",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          ImageAssets.cameraIcon,
                          color: ColorManager.white,
                        ),
                        SizedBox(width: 10.0),
                        SvgPicture.asset(
                          ImageAssets.chatAudioCallIcon,
                          color: ColorManager.white,
                          height: 20,
                          width: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(color: ColorManager.grey),
                //---------------------------------------------------
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount:_.singleChat.conversations!.data!.length ,
                        itemBuilder: (context,index){
                      return _.singleChat.conversations!.data![index].createdByUserId.toString()==_.userId?
                      userChatBubble(_.singleChat.conversations!.data![index]): otherUserChatBubble(_.singleChat.conversations!.data![index]);
                    })
                  ),
                ),
                Container(
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: ColorManager.chatInputFiledColor,
                        //color: Color(0xfff1f1f1),
                        border: Border.all(color: Colors.grey)),
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: SvgPicture.asset(
                                ImageAssets.smileIcon,
                                // height: 18,
                                //color: Colors.white,
                              )),
                        ),
                        Expanded(
                            child: TextField(
                              cursorColor: ColorManager.red,
                              controller:_.textMessage ,
                              style: TextStyle(color: ColorManager.hinttextdarkColor),
                              decoration: InputDecoration(
                                  hintText: 'Typing Comment...',
                                  focusColor: Colors.red,
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  hintStyle: getmediumStyle(
                                      color: ColorManager.hinttextdarkColor,
                                      fontSize: AppSize.s10.mv)),
                            )),
                        InkWell(
                          onTap: (){
                            if(_.textMessage!="") {
                              String receiverId="";
                              receiverId=  _.singleChat.users!.data!.where((element) => element.userId.toString()!=_.userId).first.userId.toString();
                              print("===receiverId:${receiverId}=======");
                              _.sendSMS( receiverId).then((respons) {
                                if(respons.isSuccess){
                                  showCustomSnackBar(respons.message);
                                  // DateTime now = DateTime.now();
                                  // String dateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
                                  // int id=1;
                                  // id=_.singleChat.conversations!.data!.last.id!;
                                  // ConversationData sendSms=_.singleChat.conversations!.data!.last;
                                  // sendSms.userId=int.parse(_.userId);
                                  // sendSms.text= _.textMessage.text;
                                  // sendSms.createdAt=dateTime;
                                  // sendSms.id=id+1;
                                  // sendSms.messageId=id+1;
                                  // _.singleChat.conversations!.data?.add(sendSms);
                                  // _.update();

                                }else{
                                  showCustomSnackBar(respons.message);
                                }
                                print("===${respons.message}===");
                              });
                              _.textMessage.clear();
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorManager.red,
                            ),
                            child: SvgPicture.asset(
                              ImageAssets.sendIcon,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        );
      },),
    );
  }
}
