import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/presentation/resources/list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../presentation/resources/index_manager.dart';

class PkVideosWidget extends StatefulWidget {
  const PkVideosWidget({Key? key}) : super(key: key);

  @override
  State<PkVideosWidget> createState() => _PkVideosWidgetState();
}

class _PkVideosWidgetState extends State<PkVideosWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: ((context, index) => SizedBox(height: 15.0)),
        itemCount: 10,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return pkvideos(
              img1: Lists.storiesprofile[index],
              name1: Lists.storiesname[index],
              img2: Lists.FresherUserList1[index],
              name2: Lists.pkname[index]);
        });
  }

  Widget pkvideos({String? img1, String? name1, String? img2, String? name2}) {
    double cw = AppSize.sizeWidth(context) / 3.3;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.0),
      child: Container(
        width: AppSize.sizeWidth(context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: ColorManager.primarydarkdarkColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  children: [
                    Container(
                      child: Stack(
                        children: [
                          Container(
                            height: 50,
                            width: 85,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ColorManager.primary,
                                  shape: BoxShape.circle),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: AssetImage(img1!),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            child: Container(
                              // height: 20,
                              // width: 100,

                              child: SvgPicture.asset(
                                ImageAssets.pkbannerIcon,
                                height: 30,
                                width: 150,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(name1!,
                        style: getsemiboldStyle(
                          color: ColorManager.white,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text("New York, USA",
                          style: getmediumStyle(
                            color: ColorManager.hinttextdarkColor,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: cw / 2.5,
                            decoration: BoxDecoration(
                                color: ColorManager.darkblue,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Center(
                                child: Text(
                                  "Lv.09",
                                  style: getsemiboldStyle(
                                      color: ColorManager.white,
                                      fontSize: 8.mv),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Container(
                            width: cw / 2.5,
                            decoration: BoxDecoration(
                                color: ColorManager.gradientColor,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    ImageAssets.crownIcon,
                                    height: 12,
                                    width: 12,
                                  ),
                                  SizedBox(width: 3.0),
                                  Text(
                                    "06",
                                    style: getsemiboldStyle(
                                        color: ColorManager.white,
                                        fontSize: 8.mv),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
              vsbutton(),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Column(
                  children: [
                    Container(
                      child: Stack(
                        children: [
                          Container(
                            height: 50,
                            width: 85,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: ColorManager.primary,
                                  shape: BoxShape.circle),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: AssetImage(img2!),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            child: Container(
                              // height: 20,
                              // width: 100,

                              child: SvgPicture.asset(
                                ImageAssets.pkbannerIcon,
                                height: 30,
                                width: 150,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(name2!,
                        style: getsemiboldStyle(
                          color: ColorManager.white,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text("New York, USA",
                          style: getmediumStyle(
                            color: ColorManager.hinttextdarkColor,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: cw / 2.5,
                            decoration: BoxDecoration(
                                color: ColorManager.darkblue,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Center(
                                child: Text(
                                  "Lv.09",
                                  style: getsemiboldStyle(
                                      color: ColorManager.white,
                                      fontSize: 8.mv),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Container(
                            width: cw / 2.5,
                            decoration: BoxDecoration(
                                color: ColorManager.gradientColor,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    ImageAssets.crownIcon,
                                    height: 12,
                                    width: 12,
                                  ),
                                  SizedBox(width: 3.0),
                                  Text(
                                    "06",
                                    style: getsemiboldStyle(
                                        color: ColorManager.white,
                                        fontSize: 8.mv),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget vsbutton() {
    return Container(
      height: 50,
      width: 50,
      decoration:
          BoxDecoration(color: ColorManager.primary, shape: BoxShape.circle),
      child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Center(
            child: Text(
              "VS",
              style: getboldStyle(color: ColorManager.white, fontSize: 16.mv),
            ),
          )),
    );
  }
}
