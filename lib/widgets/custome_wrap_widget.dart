import 'package:stream_up_live/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class CustomeCheckBoxWrapWidget extends StatelessWidget {
  final List<dynamic>? list;
  const CustomeCheckBoxWrapWidget({
    Key? key,
    this.list,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: List.generate(
      (list ?? []).length,
      (index) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        decoration: BoxDecoration(
            color: (list ?? [])[index].isTaped == true
                ? Colors.transparent
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
                color: (list ?? [])[index].isTaped == true
                    ? ColorManager.primary
                    : ColorManager.hinttextdarkColor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
          child: Text(
            (list ?? [])[index].title.toString(),
            style: TextStyle(
                color: (list ?? [])[index].isTaped == true
                    ? ColorManager.primary
                    : ColorManager.hinttextdarkColor),
          ),
        ),
      ),
    ));
  }
}
