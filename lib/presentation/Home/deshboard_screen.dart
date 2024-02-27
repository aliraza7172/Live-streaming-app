// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:stream_up_live/controller/dashboard_controller.dart';
import 'package:stream_up_live/controller/story_view_controller.dart';
import 'package:stream_up_live/data/model/body/custom_setting_model.dart';
import 'package:stream_up_live/data/model/body/login_user_model.dart';
import 'package:stream_up_live/data/model/body/stories_model.dart';
import 'package:stream_up_live/model/userModel.dart';
import 'package:stream_up_live/presentation/LivebroadCast/live_broad_cast_page.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../widgets/index_widget.dart';
import '../resources/index_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:stream_up_live/widgets/stacked_widget.dart';

import '../resources/list.dart';

class DeshboardView extends StatefulWidget {
  const DeshboardView({Key? key}) : super(key: key);

  @override
  State<DeshboardView> createState() => _DeshboardViewState();
}

class _DeshboardViewState extends State<DeshboardView> {
  final _channelName = "testing";
  late final TextEditingController commentController;
  late List<TextEditingController> commentControllers;

  // final TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final DashboardController _controller = Get.find<DashboardController>();
      final newsFeedModelLength = _controller.newsFeedModel.data?.length ?? 0;
      commentControllers = List.generate(
          newsFeedModelLength, (index) => TextEditingController());
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 20.vs),
              AppBarSearchField(),
              /*--------------------EditPic--------------------------------------- */
// Navigator.pushNamed(
              //context, Routes.liveViewRoute);
              // rowText(text1: AppStrings.whatsNew, text2: AppStrings.viewAll),
              // SizedBox(height: 10.0),
              // whatsaNew(),
              /*--------------------Post--------------------------------------- */
              // SizedBox(height: 5.0),
              Flexible(
                child: ListView.builder(
                    itemCount: _.newsFeedModel.data?.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          if (index == 0)
                            Column(
                              children: [
                                if (_.storiesModel.data?.length != 0)
                                  rowText(
                                      text1: AppStrings.stories,
                                      text2: AppStrings.viewAll,
                                      onTap: () {
                                        Navigator.pushNamed(context,
                                            Routes.StoriesViewPageRoute);
                                      }),
                                if (_.storiesModel.data?.length != 0) users(_),
                                CarouselSlider.builder(
                                    // key: _.widgetKey1,
                                    itemCount: _.CarouselImages.length,
                                    itemBuilder: (context, index, realIndex) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return CachedNetworkImage(
                                            fit: BoxFit.fitWidth,
                                            imageUrl: AppStrings.imgBaseUrl +
                                                "/banner/" +
                                                _.CarouselImages[index],
                                            placeholder: (context, url) =>
                                                const Center(
                                                    child: CircleAvatar(
                                                        radius: 20,
                                                        child:
                                                            CircularProgressIndicator())),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          );
                                        },
                                      );
                                    },
                                    options: CarouselOptions(
                                      onPageChanged: (index, reason) {
                                        _.current.value = index;
                                      },
                                      autoPlay: true,
                                      viewportFraction: 1,
                                      height: AppSize.sizeHeight(context) / 6,
                                    )),
                                Padding(
                                  padding: EdgeInsets.only(top: AppSize.s10),
                                  child: Obx(() {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children:
                                          _.CarouselImages.map((imageUrl) {
                                        int i =
                                            _.CarouselImages.indexOf(imageUrl);
                                        return Container(
                                          width: _.current == i ? 10 : 8.0,
                                          height: _.current == index ? 10 : 8.0,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 4.0),
                                          decoration: BoxDecoration(
                                            // shape: BoxShape.circle,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: _.current == i
                                                ? ColorManager.primary
                                                : ColorManager.white,
                                          ),
                                        );
                                      }).toList(),
                                    );
                                  }),
                                ),
                              ],
                            ),
                          userdetails(
                            data: _.newsFeedModel.data != null &&
                                    _.newsFeedModel.data!.isNotEmpty
                                ? _.newsFeedModel.data![index]
                                : null,
                            controller: _,
                            index: index,
                            commentController: commentControllers.isNotEmpty
                                ? commentControllers[index]!
                                : TextEditingController(),
                          ),
                        ],
                      );
                    }),
              ),
              // rowText(text1: AppStrings.discover, text2: AppStrings.viewAll),
              // SizedBox(height: 10.0),
              // discover(),
              // SizedBox(height: 10.0),
              // userdetails(isImage: true),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text("Events",
              //       style: getsemiboldStyle(
              //           color: ColorManager.white, fontSize: AppSize.s17.mv)),
              // ),
              // events(),
            ],
          );
        });
  }

  Widget discover() {
    return SizedBox(
      height: 180.0,
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: 5.0),
          scrollDirection: Axis.horizontal,
          itemCount: Lists.likepost.length,
          itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: index == 0 ? 8.0 : 0.0),
                child:
                    userDiscoverList(imagePath: Lists.FresherUserList1[index]),
              )),
    );
  }

  Widget userdetails({
    NewsFeedData? data,
    DashboardController? controller,
    required int index,
    required TextEditingController commentController,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.0),
      child: Column(
        children: [
          ListTile(
            leading: CachedNetworkImage(
              imageUrl:
                  AppStrings.imgBaseUrl + "/" + data!.userImage.toString(),
              placeholder: (context, url) => CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 10,
                  child: const CircularProgressIndicator()),
              errorWidget: (context, url, error) => Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  //borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    colorFilter:
                        ColorFilter.mode(Colors.black12, BlendMode.darken),
                    fit: BoxFit.cover,
                    image: AssetImage(ImageAssets.background_defaultImage),
                  ),
                ),
              ),
              imageBuilder: (context, imageProvider) => Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover, image: imageProvider)),
              ),
            ),
            title: Text(
              data.userUsername != null ? data.userUsername : data.userFullName,
              style: getmediumStyle(color: ColorManager.white, fontSize: 12.mv),
            ),

            subtitle: Text(
              "2 hours ago",
              style: getmediumStyle(color: ColorManager.grey, fontSize: 10.mv),
            ),
            // trailing: Icon(Icons.more_horiz, color: ColorManager.grey),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    data.description,
                    textAlign: TextAlign.start,
                    style: getmediumStyle(
                        color: ColorManager.white, fontSize: 10.mv),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppSize.s8),
          if (data.thumbnail != null)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  // image: DecorationImage(
                  //   colorFilter:
                  //       ColorFilter.mode(Colors.black12, BlendMode.darken),
                  //   fit: BoxFit.cover,
                  //   image: AssetImage(ImageAssets.jamesOliviaImage),
                  // ),
                ),
                // child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Align(
                //       alignment: Alignment.topRight,
                //       child: Container(
                //         decoration: BoxDecoration(
                //           color: ColorManager.primary,
                //           borderRadius: BorderRadius.circular(10.0),
                //         ),
                //         child: Padding(
                //           padding: const EdgeInsets.symmetric(
                //               horizontal: 10.0, vertical: 4.0),
                //           child: Row(
                //             mainAxisSize: MainAxisSize.min,
                //             children: [
                //               SvgPicture.asset(
                //                 ImageAssets.cameraIcon,
                //                 height: 8,
                //                 width: 8,
                //               ),
                //               SizedBox(width: AppSize.s4),
                //               Text(
                //                 "LIVE",
                //                 style: getsemiboldStyle(
                //                     color: ColorManager.white,
                //                     fontSize: 7.mv),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ))
                child: FutureBuilder(
                    future: controller?.calculateImageDimension(
                        AppStrings.imgBaseUrl +
                            "/" +
                            data.thumbnail.toString()),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          width: 100, // Placeholder width
                          height: 100, // Placeholder height
                          color: Colors.red, // Placeholder color
                        );
                      }
                      return CachedNetworkImage(
                        imageUrl: AppStrings.imgBaseUrl +
                            "/" +
                            data.thumbnail.toString(),
                        placeholder: (context, url) => CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 10,
                            child: const CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            //borderRadius: BorderRadius.circular(10.0),
                            // image: DecorationImage(
                            //   colorFilter:
                            //   ColorFilter.mode(Colors.black12, BlendMode.darken),
                            //   fit: BoxFit.cover,
                            //   image: AssetImage(ImageAssets.background_defaultImage),
                            // ),
                          ),
                        ),
                        imageBuilder: (context, imageProvider) => Container(
                          height: snapshot.data!.height / 3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill, image: imageProvider)),
                        ),
                      );
                    }),
              ),
            ),
          ListTile(
            title: Text(
              'Likes: ${data.noOfLikes ?? 0}',
            ),
            subtitle: Text(
              'Comments: ${data.noOfComments ?? 0}',
            ),
            trailing: Text(
              'Shares: ${data.noOfShares ?? 0}',
            ),
          ),

          Row(
            children: [
              IconButton(
                onPressed: () {
                  controller.toggleLike(index);
                },
                icon: Icon(
                  controller!.newsFeedModel.data![index].isLike ?? false
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: controller.newsFeedModel.data![index].isLike ?? false
                      ? Colors.red
                      : Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.showCommentsDialog(index);
                },
                icon: Icon(Icons.comment),
              ),
              IconButton(
                onPressed: () {
                  // Handle share action here
                },
                icon: Icon(Icons.share),
              ),
            ],
          ),
          TextField(
            controller: commentController,
            decoration: InputDecoration(
              hintText: 'Type your comment here...',
              suffixIcon: IconButton(
                onPressed: () {
                  print("Input field tap");
                  controller.addComment(index, commentController.text);
                  commentController.clear();
                  FocusScope.of(context).unfocus(); // Hide the keyboard
                },
                icon: Icon(Icons.send),
              ),
            ),
          ),

          //stacked images
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Row(
                //   children: [
                //     Row(
                //       children: [
                //         SvgPicture.asset(
                //           ImageAssets.heartIcon,
                //           color: ColorManager.primary,
                //         ),
                //         SizedBox(width: 5.0),
                //         Padding(
                //           padding: const EdgeInsets.all(4.0),
                //           child: Text(data.noOfLikes.toString(),
                //               style: getmediumStyle(
                //                   color: ColorManager.white,
                //                   fontSize: AppSize.s10.mv)),
                //         ),
                //       ],
                //     ),
                //     SizedBox(width: 15.0),
                //     Row(
                //       children: [
                //         SvgPicture.asset(
                //           ImageAssets.commentIcon,
                //           color: ColorManager.white,
                //         ),
                //         SizedBox(width: 5.0),
                //         Padding(
                //           padding: const EdgeInsets.all(4.0),
                //           child: Text(data.noOfComments.toString(),
                //               style: getmediumStyle(
                //                   color: ColorManager.white,
                //                   fontSize: AppSize.s10.mv)),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                // buildStackedImages(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                ImageAssets.facebookIcon,
                height: 24,
                width: AppSize.s24,
                color: ColorManager.white,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildStackedImages() {
    final double size = 36;
    final imageList = [
      ImageAssets.starUserImage1,
      ImageAssets.starUserImage2,
      ImageAssets.starUserImage3,
    ];
    final items = imageList.map((imagepath) => buildImage(imagepath)).toList();
    return Stackedwidget(
      items: items,
      size: size,
    );
  }

  Widget buildImage(String imagePath) {
    final double bordersize = AppPadding.p2;
    return ClipOval(
      child: Container(
          color: ColorManager.white,
          padding: EdgeInsets.all(bordersize),
          child: ClipOval(child: Image.asset(imagePath, fit: BoxFit.cover))),
    );
  }

  Widget whatsaNew() {
    return SizedBox(
      height: 210.0,
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: 5.0),
          scrollDirection: Axis.horizontal,
          itemCount: Lists.likepost.length,
          itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: index == 0 ? 8.0 : 0.0),
                child: userhorizanlList(
                    imagePath: Lists.likepost[index],
                    name: Lists.storiesname[index]),
              )),
    );
  }

  Widget events() {
    return SizedBox(
      height: 240.0,
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: 5.0),
          scrollDirection: Axis.horizontal,
          itemCount: Lists.liveRadioImages.length,
          itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(left: index == 0 ? 8.0 : 0.0),
                child:
                    eventhorizanlList(imagePath: Lists.liveRadioImages[index]),
              )),
    );
  }

  Widget users(DashboardController controller) {
    return Container(
      height: 110,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.storiesModel.data?.length,
          itemBuilder: (context, index) {
            StoryData story = controller.storiesModel.data![index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  List<StoryData>? viewStories = [];
                  for (int i = index;
                      i < controller.storiesModel.data!.length;
                      i++) {
                    viewStories.add(controller.storiesModel.data![index]);
                  }
                  Get.put<StoryViewController>(StoryViewController());
                  Get.find<StoryViewController>().setData(viewStories);
                  Navigator.pushNamed(context, Routes.OpenStoryViewRoute);
                },
                child: Column(children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.transparent, shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CircleAvatar(
                        radius: 30.0,
                        child: CachedNetworkImage(
                          imageUrl: AppStrings.imgBaseUrl +
                              "/" +
                              story.thumbnail.toString(),
                          placeholder: (context, url) => CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 10,
                              child: const CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              //borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                colorFilter: ColorFilter.mode(
                                    Colors.black12, BlendMode.darken),
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    ImageAssets.background_defaultImage),
                              ),
                            ),
                          ),
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover, image: imageProvider)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6.0),
                  Flexible(
                    child: Row(
                      children: [
                        Text(story.userFullName.toString(),
                            overflow: TextOverflow.fade,
                            textAlign: TextAlign.center,
                            style: getmediumStyle(
                                color: ColorManager.white,
                                fontSize: AppSize.s8.mv)),
                      ],
                    ),
                  ),
                ]),
              ),
            );
          }),
    );
  }

  Widget rowText({String? text1, String? text2, Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text1 ?? "",
              style: getsemiboldStyle(
                  color: ColorManager.white, fontSize: AppSize.s17.mv)),
          GestureDetector(
            onTap: onTap,
            child: Text(text2 ?? "", //AppStrings.viewAll,
                style: getmediumStyle(
                    color: ColorManager.primary, fontSize: AppSize.s10.mv)),
          ),
        ],
      ),
    );
  }

  Widget userhorizanlList({String? imagePath, String? name}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imagePath!),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: ColorManager.primary, shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: CircleAvatar(
                  radius: 18.0,
                  backgroundImage: AssetImage(imagePath),
                ),
              ),
            ),
            SizedBox(width: 10.0),
            Text(name!,
                style: getmediumStyle(
                    color: ColorManager.white, fontSize: AppSize.s8.mv)),
          ],
        ),
      ],
    );
  }

  Widget userDiscoverList({String? imagePath}) {
    return GestureDetector(
      onTap:
          // onJoin,
          () {
        print("gester decetor");

        Navigator.pushNamed(context, Routes.liveViewRoute);
      },
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken),
            fit: BoxFit.cover,
            image: AssetImage(imagePath!),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          ImageAssets.cameraIcon,
                          height: 8,
                          width: 8,
                        ),
                        SizedBox(width: AppSize.s4),
                        Text(
                          "LIVE",
                          style: getsemiboldStyle(
                              color: ColorManager.white, fontSize: 7.mv),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: ColorManager.white, shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: CircleAvatar(
                          radius: 18.0,
                          backgroundImage:
                              AssetImage(ImageAssets.starUserImage2),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text("James Olivia",
                        style: getmediumStyle(
                            color: Colors.white, fontSize: AppSize.s10)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget eventhorizanlList({String? imagePath}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 150,
          height: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imagePath!),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Text("LIVE-On the Radio",
            style: getmediumStyle(color: ColorManager.white, fontSize: 10.mv)),
        SizedBox(height: 5.0),
        Text("10:30 | Freedom Trail",
            style: getmediumStyle(
                color: ColorManager.hinttextdarkColor, fontSize: 8.mv)),
      ],
    );
  }

  Future<void> onJoin() async {
    // update input validation
    // setState(() {
    //   _channelName.text.isEmpty
    //       ? _validateError = true
    //       : _validateError = false;
    // });
    if (_channelName.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic(Permission.camera);
      await _handleCameraAndMic(Permission.microphone);
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            channelName: _channelName,
            // role: ClientRoleType.clientRoleAudience,
            // role: ClientRole.Audience,
            // _role,
          ),
        ),
      );
    }
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
}
