import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:stream_up_live/data/api/api_client.dart';
import 'package:stream_up_live/data/model/body/custom_setting_model.dart';
import 'package:stream_up_live/data/model/body/login_user_model.dart';
import 'package:stream_up_live/data/model/response/response_model.dart';
import 'package:stream_up_live/data/repository/profile_repo.dart';
import 'package:stream_up_live/presentation/login/login_screen.dart';
import 'package:stream_up_live/presentation/resources/color_manager.dart';
import 'package:stream_up_live/presentation/resources/strings_manager.dart';
import '../model/userModel.dart';

class EditProfileController extends GetxController {
  final ProfileRepo profileRepo = ProfileRepo(apiClient: ApiClient());
  bool isLoading = false;
  File? image;
  String selectedGender = "Select Gender";
  String selectedDOB = "";
  var box = GetStorage();
  customSettingModel settings = customSettingModel();
  FocusNode textFieldFocusNode = FocusNode();
  FocusNode searchFocusNode = FocusNode();
  UserModelDropDown selectedDropDownValues =
      UserModelDropDown(name: '', value: "");
  List<String> genderOptions = [
    'Male',
    'Female',
    'Other',
  ];
  TextEditingController nameController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  List<CountryCodes>? countryCodes = [];
  LoginUserModel user = LoginUserModel();
  @override
  void onInit() {
    super.onInit();
    editeProfileData();
  }
  Future<void> addData() async {
    nameController.text = user.data!.user!.fullName.toString();
    nickNameController.text = user.data!.user!.nickName.toString();
    numberController.text = user.data!.user!.number.toString();
    emailController.text = user.data!.user!.email.toString();
      aboutController.text = user.data!.user!.about.toString();
    selectedDropDownValues= UserModelDropDown(name: user.data!.user!.countryName.toString(),
        value: user.data!.user!.countryCodeId.toString());
      selectedDOB=user.data!.user!.DOB.toString();
    if (user.data!.user!.gender != null) {
      selectedGender = user.data!.user!.gender.toString();
    }
  }

  Future<void> editeProfileData() async {
    var loginUser = box.read(LocalDBStrings.login_user);
    var countryCode = box.read(LocalDBStrings.country_codes);
    try {
      if (loginUser != null) {
        var decodedUser = jsonDecode(loginUser);
        var decodedSetting = jsonDecode(countryCode);
        user = LoginUserModel.fromJson(decodedUser);
        // settings = customSettingModel.fromJson(decodedSetting);
        for(var data in decodedSetting)
        countryCodes?.add(CountryCodes.fromJson(data));
        // countryCodes = settings.data!.countryCodes;
      } else {
        Get.offAll(() => LoginView());
      }
    } catch (e) {
      print("====loginUser:$e============");
    }
    addData();
    update();
  }

  Future<ResponseModel> editeProfile(
      String id,
      String fullName,
      String NickName,
      String gender,
      String DOB,
      String email,
      String number,
      String about) async {
    isLoading = true;
    update();
    var body = {
      "session_user_id": id,
      "country_code_id": selectedDropDownValues.value.toString(),
      "full_name": fullName,
      "nickname": NickName,
      "gender": gender,
      "date_of_birth": selectedDOB,
      "email": email,
      "number": number,
      "about": about,
    };
    Response response = await profileRepo.editProfile(body);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      if (!response.body["error"]) {
        await box.write(LocalDBStrings.login_user, jsonEncode(response.body));
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

  Future<String> selectDateTime(BuildContext context) async {
    String Date = "";
    final DateTime? pickedDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDateTime != null) {
      final formatter = DateFormat('dd/MM/yyyy');
      Date = formatter.format(pickedDateTime);
    }else{
      Date=user.data!.user!.DOB.toString();
    }
    return Date;
  }

  void runFilter(String enteredKeyword) {
    List<CountryCodes> results = [];
    if (enteredKeyword.isEmpty) {
      results = settings.data!.countryCodes!;
    } else {
      results = settings.data!.countryCodes!
          .where((country) => country.countryTitle!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    // Refresh the UI
    countryCodes = results;
    update();
  }

  Widget customPopupItemBuilderExample2(
      BuildContext context, UserModelDropDown item, bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(5),
              color:  ColorManager.secondarydarkColor,
            ),
      child: ListTile(
        selected: isSelected,
        title: Text(item.name.toString(),style: TextStyle(color: Colors.white),),
      ),
    );
  }

  Future<List<UserModelDropDown>> getData(filter) async {
    List<UserModelDropDown> data = [];
    data = countryCodes!
        .map((country) => UserModelDropDown(
              value: country.id,
              name: country.countryTitle.toString(),
            ))
        .toList();
    return data;
  }
}
