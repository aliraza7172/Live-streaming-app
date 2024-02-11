import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:story/story_page_view.dart';
import 'package:stream_up_live/controller/story_view_controller.dart';
import '../resources/index_manager.dart';



class OpenStoryView extends StatefulWidget {
  const OpenStoryView({Key? key}) : super(key: key);

  @override
  State<OpenStoryView> createState() => _OpenStoryViewState();
}

class _OpenStoryViewState extends State<OpenStoryView> {
  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;

  @override
  void initState() {
    super.initState();
    indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
        IndicatorAnimationCommand.resume);
  }

  @override
  void dispose() {
    indicatorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoryViewController>(
      init: StoryViewController(),
        builder: (_){
      return Scaffold(
        body: StoryPageView(
          itemBuilder: (context, pageIndex, storyIndex) {
            final user = _.viewStories![pageIndex];
            final story = user.items![storyIndex];
            return Stack(
              children: [
                Positioned.fill(
                  child: Container(color: Colors.black),
                ),
                Positioned.fill(
                  child:  CachedNetworkImage(
                    imageUrl: AppStrings.imgBaseUrl+"/"+story.url.toString(),
                    placeholder: (context, url) => CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 10,
                        child: const CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Container(
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
                      decoration: BoxDecoration(
                          image:
                          DecorationImage(fit: BoxFit.cover, image: imageProvider)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 44, left: 8),
                  child: Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        child:  CachedNetworkImage(
                          imageUrl: AppStrings.imgBaseUrl+"/"+user.userImage.toString(),
                          placeholder: (context, url) => CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 10,
                              child: const CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Container(
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
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                                image:
                                DecorationImage(fit: BoxFit.cover, image: imageProvider)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        story.userFullName.toString(),
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          gestureItemBuilder: (context, pageIndex, storyIndex) {
            return Stack(children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    color: Colors.white,
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              // if (pageIndex == 0)
              //   Center(
              //     child: ElevatedButton(
              //       child: Text('show modal bottom sheet'),
              //       onPressed: () async {
              //         indicatorAnimationController.value =
              //             IndicatorAnimationCommand.pause;
              //         await showModalBottomSheet(
              //           context: context,
              //           builder: (context) => SizedBox(
              //             height: MediaQuery.of(context).size.height / 2,
              //             child: Padding(
              //               padding: EdgeInsets.all(24),
              //               child: Text(
              //                 'Look! The indicator is now paused\n\n'
              //                 'It will be coutinued after closing the modal bottom sheet.',
              //                 style: Theme.of(context).textTheme.headline5,
              //                 textAlign: TextAlign.center,
              //               ),
              //             ),
              //           ),
              //         );
              //         indicatorAnimationController.value =
              //             IndicatorAnimationCommand.resume;
              //       },
              //     ),
              //   ),
            ]);
          },
          indicatorAnimationController: indicatorAnimationController,
          initialStoryIndex: (pageIndex) {
            if (pageIndex == 0) {
              return 0;
            }
            return 0;
          },
          pageLength: _.viewStories!.length,
          storyLength: (int pageIndex) {
            return _.viewStories![pageIndex].items!.length;
          },
          onPageLimitReached: () {
            Navigator.pop(context);
          },
        ),
      );
    });
  }
}
