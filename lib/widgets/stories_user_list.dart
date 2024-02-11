import 'package:flutter/material.dart';
import '../presentation/resources/index_manager.dart';
import '../presentation/resources/list.dart';

class StoriesListWidget extends StatefulWidget {
  const StoriesListWidget({Key? key}) : super(key: key);

  @override
  State<StoriesListWidget> createState() => _StoriesListWidgetState();
}

class _StoriesListWidgetState extends State<StoriesListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
      child: GridView.builder(
        // physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
          mainAxisExtent: 250, // here set custom Height You Want
        ),
        shrinkWrap: true,
        itemCount: Lists.FresherUserList.length,
        itemBuilder: (BuildContext context, int index) {
          return userbox(
              imagePath: Lists.FresherUserList[index],
              name: Lists.storiesname[index],
              onTap: () {
                Navigator.pushNamed(context, Routes.OpenStoryViewRoute);
              });
        },
        //),
      ),
    );
  }

  Widget userbox({String? imagePath, Function()? onTap, String? name}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // height: 220,
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
          padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 8.0),
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
                          color: ColorManager.white, shape: BoxShape.circle),
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
    );
  }
}
