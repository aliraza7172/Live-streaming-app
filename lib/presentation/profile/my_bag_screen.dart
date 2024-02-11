// ignore_for_file: deprecated_member_use

import 'package:stream_up_live/widgets/index_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/presentation/resources/index_manager.dart';

class MyBagViewPage extends StatefulWidget {
  const MyBagViewPage({Key? key}) : super(key: key);

  @override
  State<MyBagViewPage> createState() => _MyBagViewPageState();
}

class _MyBagViewPageState extends State<MyBagViewPage> {
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
          "My Bag",
          style: getsemiboldStyle(
              color: ColorManager.white, fontSize: AppSize.s16.mv),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: ColorManager.primarydarkdarkColor,
            borderRadius: new BorderRadius.only(
              bottomLeft: const Radius.circular(15.0),
              bottomRight: const Radius.circular(15.0),
            ),
          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(ImageAssets.bagImage),
          )),
        ),
        SizedBox(height: 10.0),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 200, // here set custom Height You Want
                ),
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return users(index.isEven ? carImage[0] : carImage[1]);
                })),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(ImageAssets.vipInviteImage),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    "VIP",
                    style: getsemiboldStyle(
                        color: ColorManager.white, fontSize: AppSize.s16.mv),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Expiry: 3 day(s)",
                      style: getsemiboldStyle(
                          color: ColorManager.hinttextdarkColor,
                          fontSize: AppSize.s14.mv),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: ColorManager.primarydarkColor,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 20.0),
                      child: Center(
                        child: Text(
                          "Renew",
                          style: getsemiboldStyle(
                              color: ColorManager.white, fontSize: 12.mv),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 10.0),
        button(
            text: "VISIT STORE",
            color: ColorManager.primary,
            onTap: () {
              // Navigator.pushNamed(context, Routes.homeViewRoute);
            }),
      ])),
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
}
