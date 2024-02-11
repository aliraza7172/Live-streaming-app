// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stream_up_live/controller/create_post_controller.dart';
import 'package:stream_up_live/controller/create_story_controller.dart';
import 'package:stream_up_live/controller/dashboard_controller.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/presentation/resources/index_manager.dart';
import 'package:stream_up_live/widgets/custom_snackbar.dart';
import 'package:stream_up_live/widgets/custome_button.dart';

class CreateStoryPage extends StatefulWidget {
  const CreateStoryPage({Key? key}) : super(key: key);

  @override
  State<CreateStoryPage> createState() => _CreateStoryPageState();
}

class _CreateStoryPageState extends State<CreateStoryPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateStoryController>(
        init: CreateStoryController(),
        builder: (_) {
          return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: ColorManager.secondarydarkColor,
              appBar: AppBar(
                backgroundColor: ColorManager.primarydarkdarkColor,
                centerTitle: false,
                titleSpacing: 0,
                elevation: 1.0,
                leading: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SvgPicture.asset(
                      ImageAssets.arrowbackIcon,
                      color: ColorManager.white,
                    ),
                  ),
                ),
                title: Text(
                  "Create a Story",
                  style: getsemiboldStyle(
                      color: ColorManager.white, fontSize: AppSize.s16.mv),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.s10,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: AppSize.s15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CachedNetworkImage(
                            imageUrl: _.user.data!.baseUrl.toString() +
                                "/" +
                                _.user.data!.user!.image.toString(),
                            placeholder: (context, url) => Container(
                                height: 50,
                                width: 50,
                                decoration:
                                    BoxDecoration(shape: BoxShape.circle),
                                child: const CircularProgressIndicator()),
                            errorWidget: (context, url, error) => Container(
                              height: 70,
                              width: 70,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: CircleAvatar(
                                  radius: 40.0,
                                  backgroundImage:
                                      AssetImage(ImageAssets.user_defaultImage),
                                ),
                              ),
                            ),
                            imageBuilder: (context, imageProvider) => Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover, image: imageProvider)),
                            ),
                          ),
                          SizedBox(
                            width: AppSize.s20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _.user.data!.user!.nickName.toString() == "null"
                                    ? _.user.data!.user!.fullName.toString()
                                    : _.user.data!.user!.nickName.toString(),
                                style: getsemiboldStyle(
                                  color: ColorManager.white,
                                  fontSize: 16.mv,
                                ),
                              ),
                              SizedBox(
                                height: AppSize.s8,
                              ),
                              Text(
                                _.user.data!.user!.userTypeTitle.toString(),
                                style: getsemiboldStyle(
                                  color: ColorManager.white.withOpacity(0.2),
                                  fontSize: 14.mv,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: ColorManager.primarydarkdarkColor,
                    ),
                    TextFormField(
                      style: getmediumStyle(
                        color: ColorManager.lightWhite,
                        fontSize: 16.mv,
                      ),
                      controller: _.description,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "What's On Your Mind ?",
                        hintStyle: getmediumStyle(
                          color: ColorManager.lightWhite,
                          fontSize: 16.mv,
                        ),
                        filled: true,
                        fillColor: Colors.transparent,
                      ),
                      maxLines: 6,
                    ),
                    SizedBox(
                      height: AppSize.s8,
                    ),
                    if (_.image != null)
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 15, right: 5, left: 5),
                            width: double.infinity,
                            height: AppSize.sizeHeight(context) * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.file(_.image!, fit: BoxFit.fill),
                          ),
                          Positioned(
                              right: 0,
                              top: 0,
                              child: InkWell(
                                  onTap: () {
                                    _.image = null;
                                    _.update();
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ColorManager.red),
                                    child: Icon(
                                      Icons.close,
                                      size: 20,
                                      color: ColorManager.white,
                                    ),
                                  )))
                        ],
                      ),
                    SizedBox(
                      height: AppSize.s8,
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Wrap(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      Navigator.pop(context);
                                      File? file = await _
                                          .pickImage(ImageSource.gallery);
                                      if (file != null) {
                                        _.image = file;
                                        _.update();
                                      }
                                      print("=====gallery============");
                                    },
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.image_outlined,
                                        color:
                                            ColorManager.primarydarkdarkColor,
                                      ),
                                      title: Text("Gallery"),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      Navigator.pop(context);
                                      File? file =
                                          await _.pickImage(ImageSource.camera);
                                      if (file != null) {
                                        _.image = file;
                                        _.update();
                                      }
                                    },
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.camera_alt,
                                        color:
                                            ColorManager.primarydarkdarkColor,
                                      ),
                                      title: Text("Camera"),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            ImageAssets.imagesIcon,
                          ),
                          SizedBox(
                            width: AppSize.s8,
                          ),
                          Text(
                            "Photo/Album",
                            style: getmediumStyle(
                              color: ColorManager.lightWhite,
                              fontSize: 15.mv,
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    CustomButton(
                      onTap: () {
                        _.postImageData().then((respons) {
                          if (respons.isSuccess) {
                            _.createStory(respons.message).then((value) {
                              if (value.isSuccess) {
                                showCustomSnackBar(value.message);
                                Get.put(DashboardController());
                                Get.find<DashboardController>().fetchData();
                                Navigator.pop(context);
                              } else {
                                showCustomSnackBar(value.message);
                              }
                            });
                          }
                        });
                      },
                      isLoader: _.isLoading,
                      color: ColorManager.buttonRed,
                      text: "POST",
                      style: getsemiboldStyle(
                        color: ColorManager.white,
                        fontSize: 15.mv,
                      ),
                    ),
                    SizedBox(
                      height: AppSize.s10,
                    ),
                  ],
                ),
              ));
        });
  }
}
