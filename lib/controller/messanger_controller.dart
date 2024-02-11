import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stream_up_live/data/api/api_client.dart';
import 'package:stream_up_live/data/model/body/messages_model.dart';
import 'package:stream_up_live/data/model/response/response_model.dart';
import 'package:stream_up_live/data/repository/messenger_repo.dart';
import 'package:stream_up_live/database/loacal_db.dart';

class MessangerController extends GetxController{
  String userId="";
  MessagesModel messagesModel=MessagesModel();
  MessagesData singleChat=MessagesData();
  TextEditingController textMessage=TextEditingController();
  MessengerRepo messengerRepo=MessengerRepo(ApiClient());
  @override
  Future<void> onInit() async {
    messagesModel=await DBManager().fetchMessages();
    userId=await DBManager().fetchLoginUserId();
    update();
    // TODO: implement onInit
    super.onInit();
  }
  Future<ResponseModel> sendSMS(String receiverId,) async {
    Response response = await messengerRepo.sendSMS(userId,receiverId,textMessage.text.trim());
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      if(!response.body["error"]){
        DBManager().saveMessagesData(response);
        onInit();
        responseModel = ResponseModel(true, response.body['message']);
      }else{
        responseModel = ResponseModel(false, response.body['message']);
      }
    } else {
      responseModel = ResponseModel(false, response.statusText.toString());
    }
    return responseModel;
  }
}