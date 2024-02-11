import 'dart:async';
import 'package:get/get.dart';
import 'package:stream_up_live/data/api/api_client.dart';
import 'package:stream_up_live/presentation/resources/strings_manager.dart';

class ProfileRepo {
  final ApiClient apiClient;
  ProfileRepo({ required this.apiClient,});

  Future<Response> editProfile(var body) async {
    return await apiClient.puttData(AppStrings.EDITE_PROFILE, body);
  }
}
