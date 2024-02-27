import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stream_up_live/data/model/body/banner_model.dart';
import 'package:stream_up_live/data/model/body/custom_setting_model.dart';
import 'package:stream_up_live/data/model/body/stories_model.dart';
import 'package:stream_up_live/database/loacal_db.dart';
import 'package:stream_up_live/presentation/resources/color_manager.dart';

class DashboardController extends GetxController {
  var box = GetStorage();
  NewsFeedModel newsFeedModel=NewsFeedModel();
  BannerModel bannerModel=BannerModel();
  StoriesModel storiesModel=StoriesModel();
  List<String> CarouselImages=[];
  RxInt current = 0.obs;
  @override
  void onInit() {
    fetchData();
    // TODO: implement onInit
    super.onInit();
  }
  Future<void> fetchData() async{
    newsFeedModel= await DBManager().fetchNewsFeed();
    bannerModel= await DBManager().fetchBanners();
    storiesModel= await DBManager().fetchStories();
    await DBManager().fetchLoginUserId();
    print("======${await DBManager().fetchLoginUserId()}==========");
    if(bannerModel.data!=null){
      bannerModel.data!.forEach((element) {
        CarouselImages.add(element.thumbnail.toString());
      });
  }
    update();
}
  Future<Size> calculateImageDimension(String url) {
    Completer<Size> completer = Completer();
    Image image = new Image(image: CachedNetworkImageProvider(url)); // I modified this line
    image.image.resolve(ImageConfiguration()).addListener(
      ImageStreamListener(
            (ImageInfo image, bool synchronousCall) {
          var myImage = image.image;
          Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
          completer.complete(size);
        },
      ),
    );
    return completer.future;
  }
  List<Widget> buildDots() {
    return CarouselImages.map((imageUrl) {
      int index = CarouselImages.indexOf(imageUrl);
      return Container(
        width: current == index ? 10 : 8.0,
        height: current== index ? 10 : 8.0,
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(10),
          color: current == index ? ColorManager.primary : ColorManager.white,
        ),
      );
    }).toList();
  }
}