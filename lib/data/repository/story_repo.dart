import 'dart:async';
import 'package:get/get.dart';
import 'package:stream_up_live/data/api/api_client.dart';
import 'package:stream_up_live/presentation/resources/strings_manager.dart';

class StoryRepo {
  final ApiClient apiClient;
  StoryRepo({ required this.apiClient,});

  Future<Response> createPost(String userId,String dec,String imageLnk) async {
    return await apiClient.postData(AppStrings.CREATE_POST, {"session_user_id":userId,"description":dec,"image":imageLnk});
  }
  Future<Response> createStory(String userId,String dec,String imageLnk) async {
    return await apiClient.postData(AppStrings.CREATE_STORY, {"session_user_id":userId,"description":dec,"url":imageLnk});
  }
}
