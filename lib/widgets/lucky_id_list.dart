import 'package:flutter/material.dart';
import '../presentation/resources/index_manager.dart';

class LuckyIdWidgetList extends StatefulWidget {
  const LuckyIdWidgetList({Key? key}) : super(key: key);

  @override
  State<LuckyIdWidgetList> createState() => _LuckyIdWidgetListState();
}

class _LuckyIdWidgetListState extends State<LuckyIdWidgetList> {
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
              childAspectRatio: 2.0,
              // mainAxisExtent: 295, // here set custom Height You Want
            ),
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return luckeyId();
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

  Widget luckeyId() {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.primarydarkdarkColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorManager.blueSolid,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
              child: Text("26547",
                  style: getmediumStyle(color: ColorManager.white)),
            ),
          ),
          Text("10000k Beans",
              style: getmediumStyle(color: ColorManager.white)),
          Container(
            decoration: BoxDecoration(
              color: ColorManager.primary,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: Text("Purchase",
                  style: getmediumStyle(color: ColorManager.white)),
            ),
          ),
        ],
      ),
    );
  }
}
