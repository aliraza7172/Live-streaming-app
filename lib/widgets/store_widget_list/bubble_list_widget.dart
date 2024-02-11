import 'package:flutter/material.dart';
import '../../presentation/resources/index_manager.dart';

class BubblesWidgetList extends StatefulWidget {
  const BubblesWidgetList({Key? key}) : super(key: key);

  @override
  State<BubblesWidgetList> createState() => _BubblesWidgetListState();
}

class _BubblesWidgetListState extends State<BubblesWidgetList> {
  List FrameImageList = [
    ImageAssets.bubbleFrame1Image,
    ImageAssets.bubbleFrame2Image,
    ImageAssets.bubbleFrame3Image,
    ImageAssets.bubbleFrame4Image,
    ImageAssets.bubbleFrame5Image,
    ImageAssets.bubbleFrame6Image,
    ImageAssets.bubbleFrame7Image,
    ImageAssets.bubbleFrame8Image,
    ImageAssets.bubbleFrame1Image,
    ImageAssets.bubbleFrame2Image,
    ImageAssets.bubbleFrame3Image,
    ImageAssets.bubbleFrame4Image,
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: Column(
        children: [
          searchfield(),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
              childAspectRatio: 1.5,
              // mainAxisExtent: 295, // here set custom Height You Want
            ),
            shrinkWrap: true,
            itemCount: FrameImageList.length,
            itemBuilder: (BuildContext context, int index) {
              return FrameBox(FrameImageList[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget searchfield() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 45,
        width: AppSize.sizeWidth(context),
        margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 15.0),
        decoration: BoxDecoration(
          color: ColorManager.primarydarkdarkColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: ColorManager.primarydarkColor.withOpacity(0.3),
              blurRadius: 2,
              offset: Offset(0, 5), // Shadow position
            ),
          ],
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8, 0, 8),
              child: Icon(
                Icons.search,
                color: ColorManager.white,
              ),
            ),
            SizedBox(width: 10.0),
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search..",
                  hintStyle: TextStyle(color: ColorManager.white),
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget FrameBox(String ImagePath) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.primarydarkdarkColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text("Try",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: ColorManager.grey,
                  )
                  //getmediumStyle(color: ColorManager.grey),
                  ),
            ),
          ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("50000k",
                  style: getmediumStyle(color: ColorManager.primary)),
              SizedBox(width: 10.0),
              Text("Beans", style: getmediumStyle(color: ColorManager.white)),
            ],
          ),
          SizedBox(height: 5.0),
        ],
      ),
    );
  }
}
