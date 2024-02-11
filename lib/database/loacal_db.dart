import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stream_up_live/data/model/body/banner_model.dart';
import 'package:stream_up_live/data/model/body/custom_setting_model.dart';
import 'package:stream_up_live/data/model/body/login_user_model.dart';
import 'package:stream_up_live/data/model/body/messages_model.dart';
import 'package:stream_up_live/data/model/body/stories_model.dart';
import 'package:stream_up_live/presentation/login/login_with_social_media_screen.dart';
import 'package:stream_up_live/presentation/resources/strings_manager.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  DatabaseHelper.internal();

  Future<Database> initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "my_database.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE country_code ("
      "id INTEGER PRIMARY KEY,"
      "name TEXT,"
      // Add other columns for other properties
      ")",
    );
  }

  Future<int> saveData(CountryCodes data) async {
    var dbClient = await db;
    int res = await dbClient.insert("country_code", data.toJson());
    return res;
  }

  Future<List<CountryCodes>> getAllData() async {
    var dbClient = await db;
    List<Map> list = await dbClient.query("country_code");
    List<CountryCodes> data = [];
    for (var item in list) {
      data.add(CountryCodes.fromJson(item));
    }
    return data;
  }

// Add other database operations as needed (e.g., update, delete)
}

class DBManager {
  var box = GetStorage();
  Future<void> saveCustomApi(Response response) async {
    saveCountryCodesData(response);
    saveNewsFeedsData(response);
    saveBannersData(response);
    saveStoriesData(response);
    saveMessagesData(response);
  }
  //  // get Data to Database
  Future<void> saveUserData(Response response) async {
    box.write(LocalDBStrings.login_user, jsonEncode(response.body));
  }

  Future<void> saveCountryCodesData(Response response) async {
    await box.write(LocalDBStrings.country_codes,
        jsonEncode(response.body['data']['CountryCodes']));
  }

  Future<void> saveNewsFeedsData(Response response) async {
    await box.write(
        LocalDBStrings.news_feeds, jsonEncode(response.body['data']['Newsfeeds']));
  }

  Future<void> saveBannersData(Response response) async {
    await box.write(
        LocalDBStrings.banners, jsonEncode(response.body['data']['Banners']));
  }

  Future<void> saveStoriesData(Response response) async {
    await box.write(LocalDBStrings.stories, jsonEncode(response.body['data']['Stories']));
  }

  Future<void> saveMessagesData(Response response) async {
    await box.write(LocalDBStrings.messages, jsonEncode(response.body['data']['Messages']));
  }


  // get Data from Database
  Future<BannerModel> fetchBanners()async{
    BannerModel bannerModel=BannerModel();
    var data = box.read(LocalDBStrings.banners);
    try {
      if (data != null) {
        var decodedData = jsonDecode(data);
        bannerModel= BannerModel.fromJson(decodedData);
        // update();
      } else {
        Get.offAll(()=> LoginWithSocialMediaView());
      }
    } catch (e) {
      debugPrint("catch:$e");
    }
    return bannerModel;
  }

  Future<NewsFeedModel> fetchNewsFeed()async{
    NewsFeedModel newsFeedModel=NewsFeedModel();
    var data = box.read(LocalDBStrings.news_feeds);
    try {
      if (data != null) {
        var decodedData = jsonDecode(data);
        newsFeedModel= NewsFeedModel.fromJson(decodedData);
        // update();
      } else {
        Get.offAll(()=> LoginWithSocialMediaView());
      }
    } catch (e) {
      debugPrint("catch:$e");
    }
    return newsFeedModel;
  }

  Future<StoriesModel> fetchStories()async{
    StoriesModel storiesModel=StoriesModel();
    var data = box.read(LocalDBStrings.stories);
    try {
      if (data != null) {
        var decodedData = jsonDecode(data);
        storiesModel= StoriesModel.fromJson(decodedData);
        // update();
      } else {
        Get.offAll(()=> LoginWithSocialMediaView());
      }
    } catch (e) {
      debugPrint("catch:$e");
    }
    return storiesModel;
  }

  Future<String> fetchLoginUserId()async{
    var user = box.read(LocalDBStrings.login_user);
    String userId = "";
    if (user != null) {
      try {
        var decodedUser = jsonDecode(user);
        var _user = LoginUserModel.fromJson(decodedUser);
        userId = _user.data!.user!.id.toString();
      } catch (e) {
        debugPrint("catch:$e");
      }
  }else{
      Get.offAll(()=> LoginWithSocialMediaView());
  }
    return userId;
}

  Future<LoginUserModel> fetchLoginUser()async{
    LoginUserModel userModel = LoginUserModel();
    var user = box.read(LocalDBStrings.login_user);
    if (user != null) {
      try {
        var decodedUser = jsonDecode(user);
        userModel = LoginUserModel.fromJson(decodedUser);
      } catch (e) {
        debugPrint("catch:$e");
      }
  }else{
      Get.offAll(()=> LoginWithSocialMediaView());
  }
    return userModel;
}

  Future<MessagesModel> fetchMessages()async{
    MessagesModel model = MessagesModel();
    var user = box.read(LocalDBStrings.messages);
    if (user != null) {
      try {
        var decodedUser = jsonDecode(user);
        model = MessagesModel.fromJson(decodedUser);
      } catch (e) {
        debugPrint("catch:$e");
      }
  }else{
      Get.offAll(()=> LoginWithSocialMediaView());
  }
    return model;
}
}
