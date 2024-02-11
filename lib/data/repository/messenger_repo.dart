import 'package:get/get_connect/http/src/response/response.dart';
import 'package:stream_up_live/data/api/api_client.dart';
import 'package:stream_up_live/presentation/resources/strings_manager.dart';

class MessengerRepo {
  final ApiClient apiClient;
  MessengerRepo(this.apiClient);
  Future<Response> sendSMS(String userId,String receiverId,String sms) async {
    return await apiClient.postData(AppStrings.SEND_SMS, {'session_user_id':userId,'receiver_user_id':receiverId,'text':sms});
  }
}