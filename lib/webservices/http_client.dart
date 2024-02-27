import 'package:get/get_connect.dart';
import 'package:stream_up_live/presentation/resources/index_manager.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../model/new_response_model.dart';


class HTTPClient extends GetConnect {

  HTTPClient._internal();

  factory HTTPClient(){
    return _instance;
  }

  static final int _requestTimeOut = 15;
  static final HTTPClient _instance = new HTTPClient._internal();


  Future<NewResponseModel> postRequest(
      {required String url, dynamic requestBody}) async {
    try {
      Response response = await post(
        AppStrings.appBaseUrl+url, requestBody,
      ).timeout(Duration(seconds: _requestTimeOut));
      NewResponseModel responseModel = NewResponseModel.fromJson(
          jsonDecode(response.bodyString!));
      return responseModel;
    } on TimeoutException catch (_) {
      return Future.value(NewResponseModel.named(
          statusCode: 408, statusDescription: "Request TimeOut", data: ""));
    } on SocketException catch (_) {
      return Future.value(NewResponseModel.named(
          statusCode: 400, statusDescription: "Bad Request", data: ""));
    } catch (_) {
      return Future.value(NewResponseModel.named(
          statusCode: 500, statusDescription: "Server Error", data: ""));
    }
  }

  Future<NewResponseModel> getRequest({required String url}) async {
    try {
      Response response = await get(url)
          .timeout(Duration(seconds: _requestTimeOut));
      NewResponseModel responseModel = NewResponseModel.fromJson(
          jsonDecode(response.bodyString!));
      return responseModel;
    }
    on TimeoutException catch (_) {
      return Future.value(NewResponseModel.named(
          statusCode: 408, statusDescription: "Request TimeOut", data: ""));
    } on SocketException catch (_) {
      return Future.value(NewResponseModel.named(
          statusCode: 400, statusDescription: "Bad Request", data: ""));
    } catch (_) {
      return Future.value(NewResponseModel.named(
          statusCode: 500, statusDescription: "Server Error", data: ""));
    }
  }
}
