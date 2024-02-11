import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:stream_up_live/controller/auth_controller.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/presentation/resources/index_manager.dart';
import 'package:stream_up_live/widgets/custom_snackbar.dart';
import 'package:stream_up_live/widgets/index_widget.dart';
import 'package:flutter/material.dart';
import 'package:stream_up_live/widgets/loader.dart';

class CreatePasswordView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  CreatePasswordView({Key? key}) : super(key: key);
TextEditingController password=TextEditingController();
TextEditingController cnfrmPassword=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController(),
        builder: (_){return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: AppSize.s50.vs),
              AppLogoView(),
              SizedBox(height: AppSize.s10.vs),
              Text(
                AppStrings.newPassword,
                textAlign: TextAlign.center,
                style: getboldStyle(
                    color: ColorManager.white, fontSize: AppSize.s20.mv),
              ),
              SizedBox(height: AppSize.s10.vs),
              Text(
                AppStrings.strongPasswords,
                textAlign: TextAlign.center,
                style: getmediumStyle(
                    color: ColorManager.white, fontSize: AppSize.s16.mv),
              ),
              SizedBox(height: AppSize.s30.vs),
              CustomeTextFormField(
                obscureText: true,
                fillColor: ColorManager.primarydarkColor,
                controller:password,
                hintText: "Password",
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return 'Enter Password';
                  }
                  return null;
                },
              ),
              SizedBox(height: AppSize.s20.vs),
              CustomeTextFormField(
                obscureText: true,
                controller: cnfrmPassword,
                fillColor: ColorManager.primarydarkColor,
                hintText: " Confirm Password",
                validator: (String? val) {
                  if (val == null || val.isEmpty) {
                    return 'Enter Confirm Password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.vs),
              button(
                text: AppStrings.changePassword,
                loader: _.isLoading,
                color: ColorManager.red,
                context: context,
                onTap: () {
                  FocusScope.of(context).unfocus();
                  _sendCode(_, context);
                },
              ),
            ],
          ),
        ),
      ),
    );});
  }
  void _sendCode(AuthController authController,BuildContext context) async {
    String _password = password.text.trim();
    String _cnfrmPassword = cnfrmPassword.text.trim();
    if (_password.isEmpty) {
      showCustomSnackBar('enter_password'.tr);
    }else if(_cnfrmPassword.isEmpty) {
      showCustomSnackBar('enter_confirm_password'.tr);
    }
    else if (_password!=_cnfrmPassword) {
      showCustomSnackBar('enter_same_password'.tr);
    }
    else {
      authController.createPassword(_password,).then((status) async {
        if (status.isSuccess) {
          debugPrint("=======status${status.isSuccess}:${status.message}=======");

          Navigator.pushReplacementNamed(context, Routes.loginRoute);
          // Navigator.pushNamedAndRemoveUntil(context, Routes.homeViewRoute, (route) => false);
        } else {
          debugPrint(
              "=======status${status.isSuccess}:${status.message}=======");
          showCustomSnackBar(status.message);
        }
      });
    }
  }
  Widget button(
      {Function()? onTap, String? text, Color? color, BuildContext? context,loader}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context!) * 0.06, vertical: 10.0),
      child: CustomButton(
        isLoader: loader,
          color: color!,
          text: text ?? "",
          style: getboldStyle(
            color: ColorManager.white,
          ),
          onTap: onTap),
    );
  }
}
