import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stream_up_live/agora/agora_widget.dart';
import 'package:stream_up_live/widgets/create_opt_dialog_box.dart';
import '../presentation/resources/index_manager.dart';

class AppBarSearchField extends StatelessWidget {
  const AppBarSearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: 45,
              margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 15.0),
              decoration: BoxDecoration(
                color: ColorManager.primarydarkdarkColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.primarydarkColor.withOpacity(0.3),
                    blurRadius: 2,
                    offset: Offset(0, 5), // Shadow position
                  ),
                ],
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 8, 0, 8),
                    child: Icon(
                      Icons.search,
                      color: ColorManager.white,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Flexible(
                    child: TextField(
                      style: TextStyle(color: ColorManager.white),
                      decoration: InputDecoration(
                        hintText: "Search..",
                        hintStyle: TextStyle(color: ColorManager.white),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10.0),
          InkWell(
            onTap: () {
              // Get.to(()=>AgoraClass());
              showDialog(
                  context: context,
                  builder: (context) {
                    return CustomDialog();
                  });
            },
            // onTap: () =>Navigator.pushNamed(context, Routes.createStoryPage),
            child: ClipOval(
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.primary,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.add, color: ColorManager.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
