import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:stream_up_live/data/model/body/login_user_model.dart';
import 'package:stream_up_live/database/loacal_db.dart';

class GoLiveController extends GetxController{
  LoginUserModel user = LoginUserModel();
   CameraController? controller;
  late List<CameraDescription> _cameras;
  CameraLensDirection _currentDirection = CameraLensDirection.back;
  @override
  void onInit() async {
    user=await DBManager().fetchLoginUser();
    _cameras = await availableCameras();
   await cameraInit(_cameras[0]);
    update();
    // TODO: implement onInit
    super.onInit();
  }
  Future<void> cameraInit(CameraDescription camera)async{
    controller = CameraController(camera, ResolutionPreset.high);
    controller!.initialize().then((_) {
      update();
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print("=====CameraAccessDenied========");
          // Handle access errors here.
            break;
          default:
          // Handle other errors here.
            break;
        }
      }});
  }


  void toggleCamera() async {
    if ( _cameras.isEmpty) return;
    if (controller != null) {
      CameraDescription newCamera = _cameras.firstWhere(
            (camera) => camera.lensDirection != _currentDirection,
      );
      await controller!.dispose();
      await cameraInit(newCamera);
        _currentDirection = newCamera.lensDirection;
        update();
    }
  }
}