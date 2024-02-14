import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stream_up_live/data/api/api_client.dart';
import 'package:stream_up_live/data/model/body/custom_setting_model.dart';
import 'package:stream_up_live/data/model/body/login_user_model.dart';
import 'package:stream_up_live/data/model/response/response_model.dart';
import 'package:stream_up_live/data/repository/auth_repo.dart';
import 'package:stream_up_live/database/loacal_db.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/presentation/login/login_screen.dart';
import '../../widgets/index_widget.dart';
import '../resources/index_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  var box = GetStorage();
  final AuthRepo authRepo = AuthRepo(apiClient: ApiClient());
  _startDelay() {
    _timer = Timer(Duration(seconds: 3), _goNext);
  }

  _goNext() async {
    String userId = await DBManager().fetchLoginUserId();
    if (userId != "") {
      customApi(
        userId,
      );
      Navigator.pushReplacementNamed(context, Routes.homeViewRoute);
    } else {
      Navigator.pushReplacementNamed(context, Routes.loginWithSocialMediaRoute);
    }
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BackgroundImage(
          child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(height: 250, ImageAssets.applogo
                  //appLogo,
                  ),
              SizedBox(height: AppSize.s12),
              Text(
                'YAMMY',
                style: getsemiboldStyle(
                    color: ColorManager.white, fontSize: AppSize.s30.mv),
              ),
              Text(
                'Video & Voice Chat',
                style: getsemiboldStyle(
                    color: ColorManager.white, fontSize: AppSize.s30.mv),
              ),
            ],
          ),
        ),
      ));
  Future<ResponseModel> customApi(
    String userId,
  ) async {
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
}
