import 'package:flutter/material.dart';
import 'package:stream_up_live/widgets/loader.dart';
import '../presentation/resources/index_manager.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String? text;
  FontWeight? fontWeight;
  final Color? color;
  Function()? onTap;
  TextStyle? style;
  bool isLoader;

  CustomButton(
      {Key? key,
      this.onTap,
      this.text,
      this.style,
      this.isLoader = false,
      this.fontWeight = FontWeight.normal,
      this.color = ColorManager.blackColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 17.0),
          child: isLoader
              ? SizedBox(
            height: AppSize.s15,
              width: AppSize.s15,
              child: Loader())
              : Text(
                  text!,
                  style: style,
                ),
        )),
      ),
    );
  }
}
