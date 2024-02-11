import 'package:get/get.dart';
import 'package:stream_up_live/presentation/resources/routes_manager.dart';

class ApiChecker {
  static void checkApi(Response response) {
    if(response.statusCode == 401) {
      Get.offAllNamed( Routes.loginRoute);
    }else {
      // showCustomSnackBar(response.statusText);
    }
  }
}
