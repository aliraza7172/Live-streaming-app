import 'package:flutter/material.dart';

class CircularImageOuter extends StatelessWidget {
  final String outerImagePath;
  final String innerImagePath;
  final double outerSize;
  final double innerSize;

  CircularImageOuter({
    required this.outerImagePath,
    required this.innerImagePath,
    this.outerSize = 150.0,
    this.innerSize = 55.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(top: 10,left: 10),
      width: outerSize,
      height: outerSize,
      child: ClipOval(
        child: Stack(
          children: [
            // Outer Image
            Image.asset(
              outerImagePath,
              width: outerSize,
              height: outerSize,
              fit: BoxFit.cover,
            ),
            // Inner Image
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: ClipOval(
                  child: Container(
                    width: innerSize,
                    height: innerSize,
                    color: Colors.white, // Set background color for inner image
                    child: Image.asset(
                      innerImagePath,
                      width: innerSize,
                      height: innerSize,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



/**
 *   //  ! 2 section
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 5),
                child: Container(
                  height: 80,
                  width: 80,
                  color: ColorManager.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          foregroundIconsStream(
                              size: size,
                              imagePath: ImageAssets.userSettingStreamLive),
                          SizedBox(
                            width: size.width * 0.02,
                          ),
                          foregroundIconsStream(
                              size: size, imagePath: ImageAssets.musicStream),
                        ],
                      ),
                      Container(
                          height: size.height * 0.05,
                          width: size.width * 0.25,
                          decoration: BoxDecoration(
                              color: ColorManager.transparentLight,
                              borderRadius: BorderRadius.circular(30)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: Expanded(
                                  child: Image(
                                    image:
                                        AssetImage(ImageAssets.timeIconStream),
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ),
                              AutoSizeText("11:33:00"),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            )
          
 */