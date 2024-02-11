import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:flutter/material.dart';

import '../presentation/resources/index_manager.dart';
import '../presentation/resources/list.dart';

class EventsListWidget extends StatefulWidget {
  const EventsListWidget({Key? key}) : super(key: key);

  @override
  State<EventsListWidget> createState() => _EventsListWidgetState();
}

class _EventsListWidgetState extends State<EventsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
          mainAxisExtent: 295, // here set custom Height You Want
        ),
        shrinkWrap: true,
        itemCount: Lists.liveRadioImages2.length,
        itemBuilder: (BuildContext context, int index) {
          return userbox(
              imagePath: Lists.liveRadioImages2[index],
              name: Lists.storiesname[index],
              onTap: () {
                //Navigator.pushNamed(context, Routes.liveViewRoute);
              });
        },
        //),
      ),
    );
  }

  Widget userbox({String? imagePath, Function()? onTap, String? name}) {
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
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: ColorManager.white,
                              shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: CircleAvatar(
                              radius: 18.0,
                              backgroundImage: AssetImage(imagePath),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Text(name!,
                            style: getmediumStyle(
                                color: Colors.white, fontSize: AppSize.s10)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        ListTile(
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
}
