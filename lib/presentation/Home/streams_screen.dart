import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/widgets/events_list_widget.dart';
import 'package:stream_up_live/widgets/pk_videos_list_widget.dart';
import 'package:stream_up_live/widgets/toggle_button_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/gameWidget.dart';
import '../../widgets/index_widget.dart';
import '../../widgets/loc_bottom_widget.dart';
import '../resources/index_manager.dart';
import '../resources/list.dart';

class StreamsView extends StatefulWidget {
  const StreamsView({Key? key}) : super(key: key);

  @override
  State<StreamsView> createState() => _StreamsViewState();
}

class _StreamsViewState extends State<StreamsView> {
  int selectedid = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(height: 20.vs),
          AppBarSearchField(),
          /*--------------------Streams--------------------------------------- */
          Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                heading(AppStrings.streams),
                GestureDetector(
                  onTap: (){
                    showModalBottomSheet(
                        context: context,
                      builder: (BuildContext context) {
                        return LocBottomWidget();
                      });
                  },
                  child: Icon(
                    Icons.location_on,
                    size: 24,
                    color: ColorManager.white,

                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
            child: Text(AppStrings.categories,
                style: getsemiboldStyle(
                    color: ColorManager.hinttextdarkColor,
                    fontSize: AppSize.s12.mv)),
          ),
          /*--------------------Category button list--------------------------------------- */
          Categories(),
          heading(selectedid == 0
              ? AppStrings.freshers
              : selectedid == 1
                  ? AppStrings.popular
                  : selectedid == 2
                      ? AppStrings.Events
                      : selectedid == 3
                          ? AppStrings.Party
                          : selectedid == 4
                           ? AppStrings.pkVideos
                         :selectedid == 5
                         ? AppStrings.game
                          : AppStrings.Party),
          /*--------------------Fresher button list--------------------------------------- */

         selectedid == 2 ?
           EventsListWidget():
          // selectedid == 3 ?
          // EventsListWidget():
          selectedid == 4 ?
          PkVideosWidget() :
          selectedid == 5 ?
          GamePage() :

          // selectedid == 2
          //     ? EventsListWidget()
          //     : selectedid == 4
          //         ? PkVideosWidget():
          //      selectedid == 3
          //         ? EventsListWidget()
          //     : selectedid == 4 // Add condition for "Game" category
          //     ? GamePage()
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 5.0),
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 10,
                          mainAxisExtent:
                              295, // here set custom Height You Want
                        ),
                        shrinkWrap: true,
                        itemCount: Lists.FresherUserList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return userbox(
                              name: Lists.storiesname[index],
                              imagePath: selectedid == 0
                                  ? Lists.FresherUserList[index]
                                  : Lists.FresherUserList1[index],
                              isLive: index == 1 || index == 2 || index == 5
                                  ? true
                                  : false,
                              onTap: () {
                                if (index == 1 || index == 2 || index == 5) {
                                  Navigator.pushNamed(
                                      context, Routes.PublicProfilePageRoute);
                                } else {
                                  Navigator.pushNamed(
                                      context, Routes.liveViewRoute);
                                }
                              });
                        },
                        //),
                      ),
                    ),
        ],
      ),
    );
  }

  Widget heading(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
      child: Text(text,
          style: getsemiboldStyle(
              color: ColorManager.white, fontSize: AppSize.s17.mv)),
    );
  }

  Widget userbox(
      {String? imagePath, Function()? onTap, bool? isLive, String? name}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.darken),
                fit: BoxFit.cover,
                image: AssetImage(imagePath!),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 3.0, vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: isLive ?? false
                        ? []
                        : [
                            Container(
                              decoration: BoxDecoration(
                                color:
                                    ColorManager.blackBorder.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 4.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(ImageAssets.volumeIcon),
                                    SizedBox(width: AppSize.s4),
                                    Text(
                                      "451",
                                      style: getsemiboldStyle(
                                          color: ColorManager.white,
                                          fontSize: 7.mv),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
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
                                          color: ColorManager.white,
                                          fontSize: 7.mv),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child:
                        Text(name!, style: getmediumStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
        ListTile(
          onTap: (() =>
              Navigator.pushNamed(context, Routes.PublicProfilePageRoute)),
          contentPadding: EdgeInsets.zero,
          leading: Container(
            decoration: BoxDecoration(
                color: ColorManager.primary, shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: CircleAvatar(
                radius: 16.0,
                backgroundImage: AssetImage(imagePath),
              ),
            ),
          ),
          title: Text(
            name,
            style: TextStyle(fontSize: 12.mv, color: ColorManager.white),
          ),
          subtitle: Text(
            "100k Following",
            style: TextStyle(
                fontSize: 10.mv, color: ColorManager.greydarkThemeColor),
          ),
        ),
      ],
    );
  }

  Widget Categories() {
    return ToggleButtonList(
      selected: selectedid,
      callback: (int index) {
        setState(() {
          selectedid = index;
        });
        //pageController.jumpToPage(index);
      },
      categories: Lists.categories,
    );
  }
}
