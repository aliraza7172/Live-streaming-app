import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:googleapis/androidpublisher/v3.dart';
import 'package:stream_up_live/data/model/body/banner_model.dart';
import 'package:stream_up_live/data/model/body/custom_setting_model.dart';
import 'package:stream_up_live/data/model/body/login_user_model.dart';
import 'package:stream_up_live/data/model/body/stories_model.dart';
import 'package:stream_up_live/database/loacal_db.dart';
import 'package:stream_up_live/presentation/resources/color_manager.dart';
import 'package:flutter/widgets.dart' as flutter;

class DashboardController extends GetxController {
  var box = GetStorage();
  NewsFeedModel newsFeedModel = NewsFeedModel();
  BannerModel bannerModel = BannerModel();
  StoriesModel storiesModel = StoriesModel();
  List<String> CarouselImages = [];
  RxInt current = 0.obs;
  @override
  void onInit() {
    fetchData();
    // TODO: implement onInit

    super.onInit();
  }

  Future<void> fetchData() async {
    newsFeedModel = await DBManager().fetchNewsFeed();
    bannerModel = await DBManager().fetchBanners();
    storiesModel = await DBManager().fetchStories();
    await DBManager().fetchLoginUserId();
    print("======${await DBManager().fetchLoginUserId()}==========");
    if (bannerModel.data != null) {
      bannerModel.data!.forEach((element) {
        CarouselImages.add(element.thumbnail.toString());
      });
    }
    update();
  }

  // Future<Size> calculateImageDimension(String url) {
  //   Completer<Size> completer = Completer();
  //   Image image = new Image(
  //       image: CachedNetworkImageProvider(url)); // I modified this line
  //   image.image.resolve(ImageConfiguration()).addListener(
  //     ImageStreamListener(
  //       (ImageInfo image, bool synchronousCall) {
  //         var myImage = image.image;
  //         Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
  //         completer.complete(size);
  //       },
  //     ),
  //   );
  //   return completer.future;
  // }

  Future<Size> calculateImageDimension(String url) {
    Completer<Size> completer = Completer();
    flutter.Image image = flutter.Image(
        image: CachedNetworkImageProvider(
            url)); // Modify this line to use the alias
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
        height: current == index ? 10 : 8.0,
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(10),
          color: current == index ? ColorManager.primary : ColorManager.white,
        ),
      );
    }).toList();
  }

  void toggleLike(int index) {
    // Toggle the isLike state and update likes count
    bool isLiked = !(newsFeedModel.data![index].isLike ?? false);
    newsFeedModel.data![index].isLike = isLiked;

    if (isLiked) {
      newsFeedModel.data![index].noOfLikes =
          (newsFeedModel.data![index].noOfLikes ?? 0) + 1;
    } else {
      newsFeedModel.data![index].noOfLikes =
          (newsFeedModel.data![index].noOfLikes ?? 0) - 1;
    }

    update();
  }

  void addComment(int index, String comment) {
    if (comment.isNotEmpty) {
      if (newsFeedModel.data![index].comments == null) {
        newsFeedModel.data![index].comments = [];
      }
      newsFeedModel.data![index].comments!.add(comment);
      // Increment comment count only when a new comment is added
      newsFeedModel.data![index].noOfComments =
          newsFeedModel.data![index].comments!.length;
      update();
    }
  }

  void showCommentsDialog(int index) async {
    List<String>? comments = newsFeedModel.data![index].comments;
    if (comments != null && comments.isNotEmpty) {
      LoginUserModel loginUser = await DBManager().fetchLoginUser();

      showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            title: Text('Comments'),
            content: Container(
              width: double.maxFinite,
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, commentIndex) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 16,
                          // You can add a profile image for the commenter here
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                loginUser.data!.user!.fullName ?? 'Username',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(comments[commentIndex]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
    } else {
      Get.snackbar('No Comments', 'There are no comments on this post.');
    }
  }
}
