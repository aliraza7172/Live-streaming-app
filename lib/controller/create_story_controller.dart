import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stream_up_live/data/api/api_client.dart';
import 'package:stream_up_live/data/model/body/login_user_model.dart';
import 'package:stream_up_live/data/repository/auth_repo.dart';
import 'package:stream_up_live/data/repository/story_repo.dart';
import 'package:stream_up_live/database/loacal_db.dart';
import 'package:stream_up_live/presentation/login/login_screen.dart';
import 'package:stream_up_live/presentation/login/login_with_social_media_screen.dart';
import 'package:stream_up_live/presentation/resources/strings_manager.dart';

import '../data/model/response/response_model.dart';
import '../widgets/custom_snackbar.dart';

class CreateStoryController extends GetxController {
  var box = GetStorage();
  bool isLoading = false;
  LoginUserModel user = LoginUserModel();
  final StoryRepo storyRepo = StoryRepo(apiClient: ApiClient());
  File? image;
  TextEditingController description = TextEditingController();
  @override
  Future<void> onInit() async {
    user=await DBManager().fetchLoginUser();
    update();
    // TODO: implement onInit
    super.onInit();
  }

  Future<File?> pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(
      source: source,
    );
    if (image != null) {
      return File(image.path);
    } else {
      return null;
    }
  }

  Future<ResponseModel> postImageData() async {
    isLoading = true;
    update();
    var f = image;
    ResponseModel responseModel = ResponseModel(false, "");
    try {
      var request = await http.MultipartRequest(
          "POST",
          Uri.parse(
              AppStrings.appBaseUrl + "api/mobile/story/picture/upload"));
      request.fields["session_user_id"] = user.data!.user!.id.toString();
      var pic = await http.MultipartFile.fromPath("file", f!.path);
      request.files.add(pic);
      var response = await request.send();
      await response.stream.transform(utf8.decoder).listen((value) async {
        var respons = json.decode(value);
        if (respons['error'].toString() == 'false') {
          // showCustomSnackBar(respons['message'].toString());
          responseModel = ResponseModel(
              true,
              respons['data']['directory'].toString() +
                  "/" +
                  respons['data']['uploaded_file'].toString());
        } else {
          showCustomSnackBar(respons['message'].toString());
          responseModel = ResponseModel(false, respons['message'].toString());
        }
      });
    } catch (e) {
      responseModel = ResponseModel(false, e.toString());
      print(e);
    }
    return responseModel;
  }

  Future<ResponseModel> createStory(String imgLink) async {
    isLoading = true;
    update();
    Response response = await storyRepo.createStory(user.data!.user!.id.toString(), description.text.trim(), imgLink);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      if (!response.body["error"]) {
        DBManager().saveStoriesData(response);
        responseModel = ResponseModel(true, response.body['message']);
      } else {
        responseModel = ResponseModel(false, response.body['message']);
      }
    } else {
      responseModel = ResponseModel(false, response.statusText.toString());
    }
    isLoading = false;
    update();
    return responseModel;
  }
}
