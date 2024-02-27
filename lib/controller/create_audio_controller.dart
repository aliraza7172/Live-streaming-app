import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stream_up_live/data/model/body/login_user_model.dart';
import 'package:stream_up_live/database/loacal_db.dart';
import 'package:stream_up_live/presentation/resources/index_manager.dart';
import 'package:stream_up_live/webservices/http_client.dart';

import '../model/new_response_model.dart';
import '../presentation/resources/routes_manager.dart';

class CreateAudioLiveController extends GetxController{

  RxList<String> selectedTags = <String>[].obs;
  TextEditingController titleController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onClose() {
    titleController.dispose();
    super.onClose();
  }

  Future<void> startLive() async {
    final String roomId = Random().nextInt(100000).toString();
    final String title = titleController.text;
    final HTTPClient client = HTTPClient();
    LoginUserModel model =  await DBManager().fetchLoginUser();
    print("model---${model.data?.user?.code}");
    var reqBody = {"title":title,"tags":"tags","live_type":"A","profile_url":model.data?.user?.image,
    "room_id":roomId,"level":"1","category_id": "1" , "username" : model.data?.user?.fullName ,
    "userid" : model.data?.user?.id , "call_status": "S" , "user_status" : "H" };
    // NewResponseModel responseModel = await client.postRequest(url: AppStrings.CREATE_LIVE_CHAT,requestBody: reqBody);
    // print("response---${responseModel.toString()}");
      Get.back();
     Get.toNamed(Routes.AudioLiveUsersViewRoute, arguments: {
      'roomId': roomId,
      'isHost': true,
      'title': title,
       'username':model.data?.user?.fullName
    });
  }
}