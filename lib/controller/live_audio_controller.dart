import 'dart:ui';

import 'package:get/get.dart';

import '../theme/custom_text_style.dart';
import '../utils/app_constants.dart';


class LiveAudioController extends GetxController{
  final RxInt giftStatus = 1.obs;
  final RxInt backPackStatus = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }
   void changeTextStyle(SelectMode mode){
     if(mode== SelectMode.gift){
       giftStatus.value = 1;
       backPackStatus.value = 0;
     }
     else if(mode==SelectMode.backpacks){
       giftStatus.value = 0;
       backPackStatus.value = 1;
     }
   }

}