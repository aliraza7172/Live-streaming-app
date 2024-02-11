import 'dart:convert';
import 'dart:io';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stream_up_live/data/api/api_client.dart';
import 'package:stream_up_live/data/model/body/login_user_model.dart';
import 'package:stream_up_live/data/model/response/response_model.dart';
import 'package:http/http.dart' as http;
import 'package:stream_up_live/data/repository/profile_repo.dart';
import 'package:stream_up_live/presentation/resources/strings_manager.dart';
import 'package:stream_up_live/widgets/custom_snackbar.dart';
class ProfileController extends GetxController{
  final ProfileRepo profileRepo=ProfileRepo(apiClient: ApiClient());
  bool isLoading=false;
  File? image;
  var box=GetStorage();
  @override
  void onInit() {
    super.onInit();
  }
  Future<ResponseModel> postImageData( File? image,String uri, LoginUserModel  user ) async {
    isLoading = true;
    update();
    var f =image;
    ResponseModel responseModel=ResponseModel(false,"");
    try {
      var request =await http.MultipartRequest("POST", Uri.parse(AppStrings.appBaseUrl+uri));
      request.fields["session_user_id"] = user.data!.user!.id.toString();
      var pic = await http.MultipartFile.fromPath("file",f!.path);
      request.files.add(pic);
      var response = await request.send();
      await  response.stream.transform(utf8.decoder).listen((value) async {
        var respons=json.decode(value);
        if (respons['error'].toString()=='false') {
          // box.remove(LocalDB.login_user);
          await box.write(LocalDBStrings.login_user, jsonEncode(respons));
          showCustomSnackBar(respons['message'].toString());
          responseModel = ResponseModel(true, respons['message'].toString());
        }else{
          showCustomSnackBar(respons['message'].toString());
          responseModel = ResponseModel(false, respons['message'].toString());
        }
      });
    } catch(e) {
      responseModel = ResponseModel(false, e.toString());
      print(e);
    }
    return responseModel;
  }
}