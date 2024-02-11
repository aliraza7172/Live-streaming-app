import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stream_up_live/data/api/api_client.dart';
import 'package:stream_up_live/data/model/response/response_model.dart';
import 'package:stream_up_live/data/repository/auth_repo.dart';
import 'package:stream_up_live/database/loacal_db.dart';
import 'package:stream_up_live/presentation/resources/strings_manager.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo=AuthRepo(apiClient: ApiClient());
  FocusNode f1 = FocusNode();
  FocusNode f2 = FocusNode();
  FocusNode f3 = FocusNode();
  FocusNode f4 = FocusNode();
  FocusNode f5 = FocusNode();
  FocusNode f6 = FocusNode();
  TextEditingController v1 = TextEditingController();
  TextEditingController v2 = TextEditingController();
  TextEditingController v3 = TextEditingController();
  TextEditingController v4 = TextEditingController();
  TextEditingController v5 = TextEditingController();
  TextEditingController v6 = TextEditingController();
  var box=GetStorage();
  bool isLoading = false;
  AuthController() {}
  String verifyCodeID="";
  @override
  void onInit() {
    super.onInit();
    // initDB();
  }
  Future<ResponseModel> login(String email, String password) async {
    isLoading = true;
    update();
    Response response = await authRepo.login(email, password);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      if(!response.body["error"]){
       await DBManager().saveUserData( response);
       String userId =await DBManager().fetchLoginUserId();
       await customApi(userId,);
      responseModel = ResponseModel(true, response.body['message']);
      }else{
        responseModel = ResponseModel(false, response.body['message']);
      }
    } else {
      responseModel = ResponseModel(false, response.statusText.toString());
    }
    isLoading = false;
    update();
    return responseModel;
  }
  Future<ResponseModel> checkEmail(String email,) async {
    isLoading = true;
    update();
    Response response = await authRepo.checkEmail(email,);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      if(!response.body["error"]){
      responseModel = ResponseModel(true, response.body['message']);
      }else{
        responseModel = ResponseModel(false, response.body['message']);
      }
    } else {
      responseModel = ResponseModel(false, response.statusText.toString());
    }
    isLoading = false;
    update();
    return responseModel;
  }
  Future<ResponseModel> customApi(String userId,) async {
    Response response = await authRepo.generalApi(
      userId,
    );
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      if (!response.body["error"]) {
        DBManager().saveCustomApi(response);
        // DatabaseHelper dbHelper=DatabaseHelper();
        // print("===response:${response.body['data']['Settings']}========");
        // var jsonList = json.decode(response.body);x
        // List<CountryCodes> dataList = jsonList.map((jsonData) => CountryCodes.fromJson(jsonData['data']['CountryCodes'])).toList();
        // Save the data to the local database
        // print("=========data:${jsonList['data']['CountryCodes'][0]}=============");
        // for (CountryCodes data in jsonList['data']['CountryCodes']) {
        //   print("=========data:${data.countryTitle}=============");
        //   await dbHelper.saveData(data);
        // }
        responseModel = ResponseModel(true, response.body['message']);
      } else {
        responseModel = ResponseModel(false, response.body['message']);
      }
    } else {
      responseModel = ResponseModel(false, response.statusText.toString());
    }
    return responseModel;
  }

  Future<ResponseModel> signup(String email, String password,name,number) async {
    isLoading = true;
    update();
    Response response = await authRepo.signup(email, password,name,number);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      if(!response.body["error"]){
      responseModel = ResponseModel(true, response.body['message']);
      }else{
        responseModel = ResponseModel(false, response.body['message']);
      }
    } else {
      responseModel = ResponseModel(false, response.statusText.toString());
    }
    isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> sendCode(String email,) async {
    isLoading = true;
    update();
    Response response = await authRepo.sendCode(email);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      if(!response.body["error"]){
      responseModel = ResponseModel(true, response.body['message']);
      }else{
        responseModel = ResponseModel(false, response.body['message']);
      }
    } else {
      responseModel = ResponseModel(false, response.statusText.toString());
    }
    isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> validateCode(String code,) async {
    isLoading = true;
    update();
    Response response = await authRepo.validateCode(code);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      if(!response.body["error"]){
        verifyCodeID=response.body['data'];
      responseModel = ResponseModel(true, response.body['message']);
      }else{
        responseModel = ResponseModel(false, response.body['message']);
      }
    } else {
      responseModel = ResponseModel(false, response.statusText.toString());
    }
    isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> createPassword(String password,) async {
    isLoading = true;
    update();
    Response response = await authRepo.createPassword(password,verifyCodeID);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      if(!response.body["error"]){
      responseModel = ResponseModel(true, response.body['message']);
      }else{
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