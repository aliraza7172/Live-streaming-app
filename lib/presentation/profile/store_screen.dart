// ignore_for_file: deprecated_member_use

import 'package:stream_up_live/widgets/lucky_id_list.dart';
import 'package:stream_up_live/widgets/store_widget_list/bubble_list_widget.dart';
import 'package:stream_up_live/widgets/toggle_button_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/presentation/resources/index_manager.dart';

class StoreViewPage extends StatefulWidget {
  const StoreViewPage({Key? key}) : super(key: key);

  @override
  State<StoreViewPage> createState() => _StoreViewPageState();
}

class _StoreViewPageState extends State<StoreViewPage> {
  int selectedid = 0;
  List _categories = [
    AppStrings.Garage,
    AppStrings.LuckyID,
    AppStrings.Bubbles,
    AppStrings.Frames,
    AppStrings.Garage,
    AppStrings.LuckyID,
  ];
  List carImage = [
    ImageAssets.car1Image,
    ImageAssets.car2Image,
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
          "Store",
          style: getsemiboldStyle(
              color: ColorManager.white, fontSize: AppSize.s16.mv),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            hotwidget(),
            //  Categories1(),
            selectedid == 1
                ? LuckyIdWidgetList()
                : selectedid == 2
                    ? BubblesWidgetList()
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5.0),
                        child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              mainAxisExtent:
                                  200, // here set custom Height You Want
                            ),
                            shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return users(
                                  index.isEven ? carImage[0] : carImage[1]);
                            })),
          ],
        ),
      ),
    );
  }

  Widget users(String ImagePath) {
    return Container(
      decoration: BoxDecoration(
          color: ColorManager.primarydarkdarkColor,
          borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 10.0),
          SizedBox(height: 10.0),
          Container(
            height: 80,
            decoration: BoxDecoration(
              // color: Colors.red,
              image: DecorationImage(
                image: AssetImage(ImagePath),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Column(
            children: [
              Text(
                "Ferrari",
                style: getsemiboldStyle(
                    color: ColorManager.white, fontSize: 14.mv),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  "500,000 Beans/Week",
                  style: getsemiboldStyle(
                      color: ColorManager.white, fontSize: 9.mv),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Center(
                          child: Text(
                            "Send",
                            style: getsemiboldStyle(
                                color: ColorManager.white, fontSize: 8.mv),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Container(
                      width: 50,
                      decoration: BoxDecoration(
                          color: ColorManager.primarydarkColor,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Center(
                          child: Text(
                            "Purchase",
                            style: getsemiboldStyle(
                                color: ColorManager.white, fontSize: 8.mv),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
            ],
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }

  Widget hotwidget() {
    return ToggleButtonList(
      selected: selectedid,
      callback: (int index) {
        setState(() {
          selectedid = index;
        });
        //pageController.jumpToPage(index);
      },
      categories: _categories,
    );
  }
}
