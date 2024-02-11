import 'dart:async';
import 'package:get/get.dart';
import 'package:stream_up_live/data/api/api_client.dart';
import 'package:stream_up_live/presentation/resources/strings_manager.dart';

class AuthRepo {
  final ApiClient apiClient;
  AuthRepo({
    required this.apiClient,
  });

  Future<Response> login(String email, String password) async {
    return await apiClient
        .postData(AppStrings.LOGIN_URI, {"email": email, "password": password});
  }

  Future<Response> generalApi(String userId) async {
    return await apiClient.getData(
      AppStrings.GENERAL_URI + "?session_user_id=$userId",
    );
  }

  Future<Response> checkEmail(
    String email,
  ) async {
    return await apiClient.postData(AppStrings.CHECK_EMAIL, {
      "email": email,
    });
  }

  Future<Response> signup(String email, String password, name, number) async {
    return await apiClient.postData(AppStrings.SIGNUP_URI, {
      "email": email,
      "password": password,
      "full_name": name,
      "number": number
    });
  }

  Future<Response> sendCode(
    String email,
  ) async {
    return await apiClient.postData(AppStrings.SEND_CODE, {
      "email": email,
    });
  }

  Future<Response> validateCode(
    String code,
  ) async {
    return await apiClient.postData(AppStrings.VALIDATE_CODE, {
      "code": code,
    });
  }

  Future<Response> createPassword(String password, String token) async {
    return await apiClient.postData(
        AppStrings.CREATE_PASSWORD, {"token": token, "password": password});
  }
}
