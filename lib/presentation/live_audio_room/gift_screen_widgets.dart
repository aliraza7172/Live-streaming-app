import 'package:flutter/material.dart';
import 'package:stream_up_live/utils/size_utils.dart';

import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../utils/image_constant.dart';
import 'custom_image_view.dart';

final selectStyle = CustomTextStyles.bodyMediumTealA700;
final unselectStyle = CustomTextStyles.bodyMedium14;

 Widget buildPartOne(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(
      left: 5.h,
      right: 3.h,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildThirteen(
          context,
          one: "H",
        ),
        Padding(
          padding: EdgeInsets.only(left: 3.h),
          child: _buildThirteen(
            context,
            one: "1",
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: _buildSix(
            context,
            text: "2",
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: _buildSix(
            context,
            text: "3",
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: _buildSix(
            context,
            text: "4",
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: _buildSix(
            context,
            text: "5",
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: _buildSix(
            context,
            text: "6",
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: _buildSix(
            context,
            text: "7",
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: _buildSix(
            context,
            text: "8",
          ),
        ),
        Container(
          width: 39.h,
          margin: EdgeInsets.only(
            left: 19.h,
            bottom: 18.v,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 12.h,
            vertical: 2.v,
          ),
          decoration: AppDecoration.outlineIndigoA.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder11,
          ),
          child: Text(
            "All",
            style: CustomTextStyles.bodySmall11,
          ),
        ),
      ],
    ),
  );
}

Widget _buildThirteen(
    BuildContext context, {
      required String one,
    }) {
  return Column(
    children: [
      SizedBox(
        height: 28.adaptSize,
        width: 28.adaptSize,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgImagesRemovebgPreview,
              height: 27.v,
              width: 28.h,
              alignment: Alignment.center,
            ),
            CustomImageView(
              imagePath: ImageConstant.imgCirclePink,
              height: 28.adaptSize,
              width: 28.adaptSize,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
      Text(
        one,
        style: theme.textTheme.bodySmall!.copyWith(
          color: appTheme.tealA700,
        ),
      ),
    ],
  );
}

Widget _buildSix(
    BuildContext context, {
      required String text,
    }) {
  return Column(
    children: [
      CustomImageView(
        imagePath: ImageConstant.imgImagesRemovebgPreview,
        height: 27.v,
        width: 28.h,
      ),
      Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(right: 9.h),
          child: Text(
            text,
            style: theme.textTheme.bodySmall!.copyWith(
              color: appTheme.tealA700,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget buildPartTwo(){
  var giftStyle = selectStyle;
  var backpackStyle = unselectStyle;
   return  Align(
     alignment: Alignment.centerLeft,
     child: Padding(
       padding: EdgeInsets.only(left: 9.h),
       child: Row(
         children: [
           SizedBox(
             width: 132.h,
             child: Row(
               children: [
                 CustomImageView(
                   imagePath: ImageConstant.imgGiftBox11,
                   height: 17.adaptSize,
                   width: 17.adaptSize,
                   margin: EdgeInsets.only(bottom: 2.v),
                 ),
                 GestureDetector(
                   onTap: (){

                   },
                   child: Padding(
                     padding: EdgeInsets.only(left: 4.h),
                     child: Text(
                       "Gifts",
                       style: giftStyle,
                     ),
                   ),
                 ),
                 Spacer(),
                 CustomImageView(

                   imagePath: ImageConstant.imgBackpack11,
                   height: 17.adaptSize,
                   width: 17.adaptSize,
                   margin: EdgeInsets.only(bottom: 2.v),
                 ),
               ],
             ),
           ),
           Padding(
             padding: EdgeInsets.only(left: 8.h),
             child: Text(
               "Backpacks",
               style: backpackStyle,
             ),
           ),
         ],
       ),
     ),
   );
}

Widget buildPartThree(){
  return Padding(
    padding: EdgeInsets.only(left: 9.h),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Luxury ",
                style: CustomTextStyles.bodySmallWhiteA70012,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.h),
                child: Text(
                  "Grand",
                  style: CustomTextStyles.bodySmallWhiteA70012,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 13.h),
                child: Text(
                  "Popular",
                  style: CustomTextStyles.bodySmall12,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 14.h),
                child: Text(
                  "Regular",
                  style: CustomTextStyles.bodySmallWhiteA70012,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.h),
                child: Text(
                  "Stickers",
                  style: CustomTextStyles.bodySmallWhiteA70012,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: Text(
              "Couple",
              style: CustomTextStyles.bodySmallWhiteA70012,
            ),
          ),

          /*CustomImageView(
            imagePath: ImageConstant.imgArrowUp11,
            height: 12.v,
            width: 9.h,
            margin: EdgeInsets.only(
              left: 7.h,
              top: 4.v,
              bottom: 3.v,
            ),
          ),*/
        ],
      ),
    ),
  );
}

Widget buildPartFour(BuildContext context){
   return Padding(
     padding: EdgeInsets.only(
       left: 23.h,
       right: 29.h,
     ),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Padding(
           padding: EdgeInsets.only(bottom: 5.v),
           child: _buildSixteen(
             context,
             text: "Giftbox",
             zipcode: "10000",
           ),
         ),
         Spacer(),
         Padding(
           padding: EdgeInsets.symmetric(vertical: 6.v),
           child: _buildTwentyOne(
             context,
             flowerText: "Flowers",
             zipcodeText: "200000",
           ),
         ),
         Container(
           margin: EdgeInsets.only(
             left: 19.h,
             top: 4.v,
           ),
           padding: EdgeInsets.symmetric(
             horizontal: 8.h,
             vertical: 4.v,
           ),
           decoration: AppDecoration.outlinePurpleA.copyWith(
             borderRadius: BorderRadiusStyle.roundedBorder11,
           ),
           child: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               CustomImageView(
                 imagePath: ImageConstant.imgPngTransparent,
                 height: 36.v,
                 width: 64.h,
               ),
               SizedBox(height: 3.v),
               Text(
                 "Helicopter",
                 style: CustomTextStyles.bodySmallWhiteA700,
               ),
               Padding(
                 padding: EdgeInsets.only(left: 5.h),
                 child: _buildFifteen(
                   context,
                   zipcodeText: "30000",
                 ),
               ),
             ],
           ),
         ),
         Padding(
           padding: EdgeInsets.only(
             left: 18.h,
             top: 4.v,
             bottom: 4.v,
           ),
           child: _buildSixteen(
             context,
             text: "Giftbox",
             zipcode: "10000",
           ),
         ),
       ],
     ),
   );
}

Widget _buildSixteen(
    BuildContext context, {
      required String text,
      required String zipcode,
    }) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 60.v,
        width: 44.h,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                text,
                style: CustomTextStyles.bodySmallWhiteA700.copyWith(
                  color: appTheme.whiteA700,
                ),
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgWhiteGiftBox,
              height: 50.v,
              width: 44.h,
              alignment: Alignment.topCenter,
            ),
          ],
        ),
      ),
      Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgDiamond19,
            height: 11.adaptSize,
            width: 11.adaptSize,
            margin: EdgeInsets.only(bottom: 2.v),
          ),
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: Text(
              zipcode,
              style: CustomTextStyles.bodySmallWhiteA7009.copyWith(
                color: appTheme.whiteA700,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _buildFifteen(
    BuildContext context, {
      required String zipcodeText,
    }) {
  return Row(
    children: [
      CustomImageView(
        imagePath: ImageConstant.imgDiamond19,
        height: 11.adaptSize,
        width: 11.adaptSize,
        margin: EdgeInsets.only(bottom: 2.v),
      ),
      Padding(
        padding: EdgeInsets.only(left: 2.h),
        child: Text(
          zipcodeText,
          style: CustomTextStyles.bodySmallWhiteA7009.copyWith(
            color: appTheme.whiteA700,
          ),
        ),
      ),
    ],
  );
}


Widget _buildTwentyOne(
    BuildContext context, {
      required String flowerText,
      required String zipcodeText,
    }) {
  return SizedBox(
    height: 69.v,
    width: 46.h,
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgFlowerBouquet,
          height: 42.v,
          width: 38.h,
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 2.h),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 13.v),
            child: Text(
              flowerText,
              style: CustomTextStyles.bodySmallWhiteA700.copyWith(
                color: appTheme.whiteA700,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            zipcodeText,
            style: CustomTextStyles.bodySmallWhiteA7009.copyWith(
              color: appTheme.whiteA700,
            ),
          ),
        ),
        CustomImageView(
          imagePath: ImageConstant.imgDiamond19,
          height: 11.adaptSize,
          width: 11.adaptSize,
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.only(bottom: 2.v),
        ),
      ],
    ),
  );
}

Widget buildThirtyNine(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(
      left: 18.h,
      right: 18.h,
      bottom: 19.v,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgDiamond19,
          height: 14.adaptSize,
          width: 14.adaptSize,
          margin: EdgeInsets.symmetric(vertical: 5.v),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 4.h,
            top: 3.v,
          ),
          child: Text(
            "747474",
            style: theme.textTheme.bodyMedium,
          ),
        ),
        Spacer(),
        Container(
          width: 103.h,
          decoration: AppDecoration.outlineWhiteA.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder11,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.v),
                child: Text(
                  "1",
                  style: CustomTextStyles.bodySmallWhiteA70012,
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgArrowUp1112x12,
                height: 12.adaptSize,
                width: 12.adaptSize,
                margin: EdgeInsets.only(
                  left: 18.h,
                  top: 6.v,
                  bottom: 5.v,
                ),
              ),
              Container(
                width: 50.h,
                margin: EdgeInsets.only(left: 6.h),
                padding: EdgeInsets.symmetric(
                  horizontal: 8.h,
                  vertical: 1.v,
                ),
                decoration: AppDecoration.gradientLightGreenAToPinkA.copyWith(
                  borderRadius: BorderRadiusStyle.customBorderLR15,
                ),
                child: Text(
                  "Send",
                  style: CustomTextStyles.bodySmallWhiteA70012,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}