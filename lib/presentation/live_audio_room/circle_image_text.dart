import 'package:flutter/material.dart';
import 'package:stream_up_live/presentation/resources/color_manager.dart';
import 'package:stream_up_live/utils/size_utils.dart';

import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';

class CircularImageText extends StatelessWidget {
  final String outerImagePath;
  final String innerImagePath;
  final String text;
  final double outerSize;
  final double innerSize;
  final Color backgroundColor;
  final double borderRadius;

  CircularImageText({
    required this.outerImagePath,
    required this.innerImagePath,
    required this.text,
    this.outerSize = 150.0,
    this.innerSize = 55.0,
    this.backgroundColor = Colors.white,
    this.borderRadius = 5.0,
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
                    color: backgroundColor, // Set background color for inner image
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
            // Text with rounded background
            Positioned(
              bottom: 5.0, // Adjust margin as needed
              left: 5.0,
              right: 5.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 7.h,
                  vertical: 1.v,),
                decoration: BoxDecoration(
                  color: ColorManager.grey400, // Adjust opacity as needed
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Center(
                  child: Text(
                    text,
                      style: CustomTextStyles.poppinsRedA700,
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