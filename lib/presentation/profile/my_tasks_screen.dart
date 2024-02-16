 // ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../resources/index_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stream_up_live/widgets/custome_button.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';

class Taskmodel {
  String? iconPath;
  num? point;
  Taskmodel(this.iconPath, this.point);
}

class MyTasksViewPage extends StatefulWidget {
  const MyTasksViewPage({Key? key}) : super(key: key);

  @override
  State<MyTasksViewPage> createState() => _MyTasksViewPageState();
}

class _MyTasksViewPageState extends State<MyTasksViewPage> {
  List<Taskmodel> tasklist = [
    Taskmodel(ImageAssets.staroneImage, 100),
    Taskmodel(ImageAssets.staroneImage, 200),
    Taskmodel(ImageAssets.staroneImage, 300),
    Taskmodel(ImageAssets.star3Image, 400),
    Taskmodel(ImageAssets.star3Image, 600),
    Taskmodel(ImageAssets.star5Image, 700),
    Taskmodel(ImageAssets.star5Image, 800),
    Taskmodel(ImageAssets.star8Image, 900),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "My Task",
          style: getsemiboldStyle(
              color: ColorManager.white, fontSize: AppSize.s16.mv),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                mainAxisExtent: 110, // here set custom Height You Want
              ),
              shrinkWrap: true,
              itemCount: tasklist.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: (() =>
                        Navigator.pushNamed(context, Routes.liveViewRoute)),
                    child: taskBox(tasklist[index], index));
              },
            ),
          ),

          button(
              text: "CLAIM!",
              color: ColorManager.primary,
              onTap: () {
                // Navigator.pushNamed(context, Routes.homeViewRoute);
              }),
          Divider(color: ColorManager.grey),
          // taskBox(),
          Flexible(
            child: ListView.separated(
                padding: EdgeInsets.zero,
                separatorBuilder: ((context, index) => Divider(
                      color: ColorManager.grey,
                    )),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        //InnerChat
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => InnerChat()));
                      },
                      child: taskList());
                }),
          )
        ],
      ),
    );
  }

  Widget taskList() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    color: ColorManager.primarydarkdarkColor,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImageAssets.staroneImage,
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        "+50",
                        style: getboldStyle(color: ColorManager.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 15.0),
              Text(
                "Follow 1x Talent",
                style: getboldStyle(color: ColorManager.white),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.circular(15.0)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: Text("CLAIM!"),
            ),
          ),
        ],
      ),
    );
  }

  Widget button({Function()? onTap, String? text, Color? color}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context) * 0.3, vertical: 10.0),
      child: CustomButton(
          color: color!,
          text: text ?? "",
          style: getboldStyle(
            color: ColorManager.white,
          ),
          onTap: onTap),
    );
  }

  Widget taskBox(Taskmodel tskmodel, int index) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorManager.primarydarkColor,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          height: 50,
          width: 80,
          decoration: BoxDecoration(
            //  borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage(tskmodel.iconPath!),
            ),
          ),
        ),
        Text(tskmodel.point.toString(),
            style: getmediumStyle(color: ColorManager.white)),
      ]),
      // foregroundDecoration: RotatedCornerDecoration(
      //   color: ColorManager.primary,
      //   geometry: const BadgeGeometry(
      //       cornerRadius: 6.0,
      //       alignment: BadgeAlignment.topLeft,
      //       width: 48,
      //       height: 48),
      //   textSpan: TextSpan(
      //     text: "${index + 1}",
      //     style: TextStyle(
      //       fontSize: 14,
      //       letterSpacing: 1,
      //       fontWeight: FontWeight.bold,
      //       shadows: [BoxShadow(color: Colors.yellowAccent, blurRadius: 4)],
      //     ),
      //   ),
      // ),
    );
  }
}
