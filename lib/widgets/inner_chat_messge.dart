// ignore_for_file: deprecated_member_use

import 'package:intl/intl.dart';
import 'package:stream_up_live/data/model/body/messages_model.dart';
import 'package:stream_up_live/presentation/resources/index_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

appBarForChatScreen(BuildContext context) {
  return PreferredSize(
      preferredSize: Size(double.infinity, 100),
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.secondarydarkColor,
            boxShadow: [
              BoxShadow(color: Colors.black12, spreadRadius: 1, blurRadius: 1)
            ]),
        height: 56,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                print('presses');
                Navigator.pop(context);
              },
              child: Container(
                height: 40,
                width: 40,
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  ImageAssets.arrowbackIcon,
                  color: ColorManager.white,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => DashBoard(page:4),
                //   ),
                // );
              },
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: 45,
                        child: Container(
                          height: 40,
                          width: 40,
                          margin: EdgeInsets.only(
                              left: 0.0, right: 8.0, top: 8.0, bottom: 8.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/images/john.jpg'),
                                fit: BoxFit.fill),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 2,
                        top: 30,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          maxRadius: 5,
                          child: CircleAvatar(
                            maxRadius: 4,
                            backgroundColor: Color(0xff51ce6a),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('John Smith'),
                      Text(
                        'online',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, 'AudioCall');
              },
              child: Container(
                padding: EdgeInsets.all(4.0),
                height: 40,
                width: 40,
                child: SvgPicture.asset(
                  ImageAssets.videocallIcon,
                ),
              ),
            ),
            SizedBox(width: 5.0),
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, 'VideoCall');
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                height: 40,
                width: 40,
                child: SvgPicture.asset(
                  ImageAssets.audiocallIcon,
                ),
              ),
              // Container(
              //     height: 40,
              //     width: 40,
              //     padding: EdgeInsets.all(4.0),
              //     margin: EdgeInsets.only(
              //         left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(10.0)),
              //     child: Icon(Icons.videocam, color: Colors.grey)),
            ),
            SizedBox(width: 10.0),
          ],
        ),
      ));
}

userChatBubble(ConversationData message) {
  String time="";
  DateTime dateTime = DateTime.parse(message.createdAt);
  time = DateFormat('h:mm a').format(dateTime);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 40,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            decoration: BoxDecoration(
                color: ColorManager.primarydarkColor,
                borderRadius: BorderRadius.circular(30.0)
                // borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(30.0),
                //     bottomRight: Radius.circular(30.0),
                //     topLeft: Radius.circular(30.0)

                //     )
                ),
            child: Center(
                child: Text(
                  message.text.toString(),
              style: TextStyle(color: Colors.white),
            )),
          ),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        time,
        style: TextStyle(color: Colors.grey, fontSize: 12),
      ),
      SizedBox(
        height: 10,
      ),
    ],
  );
}

otherUserChatBubble(ConversationData message) {
  String time="";
  DateTime dateTime = DateTime.parse(message.createdAt);
  time = DateFormat('h:mm a').format(dateTime);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.circular(30.0)
                // borderRadius: BorderRadius.only(
                //     topRight: Radius.circular(30.0),
                //     bottomRight: Radius.circular(30.0),
                //     topLeft: Radius.circular(30.0))
                ),
            child: Center(
                child: Text(
                  message.text.toString(),
              style: TextStyle(color: Colors.white),
            )),
          ),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        time,
        style: TextStyle(color: Colors.grey, fontSize: 12),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}
