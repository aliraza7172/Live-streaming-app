// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/presentation/resources/image_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/index_widget.dart';
import '../resources/index_manager.dart';

class CreatePostView extends StatefulWidget {
  const CreatePostView({Key? key}) : super(key: key);

  @override
  State<CreatePostView> createState() => _CreatePostViewState();
}

class _CreatePostViewState extends State<CreatePostView> {
  final ImagePickerUtility _imagePickerUtility = ImagePickerUtility();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondarydarkColor,
      appBar: AppBar(
        backgroundColor: ColorManager.primarydarkdarkColor,
        centerTitle: false,
        titleSpacing: 0,
        elevation: 1.0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SvgPicture.asset(
              ImageAssets.arrowbackIcon,
              color: ColorManager.white,
            ),
          ),
        ),
        title: Text(
          AppStrings.createPost.toUpperCase(),
          style: getsemiboldStyle(
              color: ColorManager.white, fontSize: AppSize.s16.mv),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            listTile(),
            Divider(color: ColorManager.grey),
            inputFiled(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                width: AppSize.sizeWidth(context),
                // color: ColorManager.primary,
                decoration: _imagePickerUtility.image != null
                    ? BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        image: DecorationImage(
                            image: FileImage(File(_imagePickerUtility.image!)),
                            fit: BoxFit.cover),
                        //shape: BoxShape.circle,
                      )
                    : BoxDecoration(),
              ),
            ),
            SizedBox(height: 10.0),
            Divider(color: ColorManager.grey),
            ListTile(
              onTap: (() async {
                setState(() {});
              }),
              leading: SvgPicture.asset(ImageAssets.galleryIcon),
              title: Text("Photo/Album",
                  style: getmediumStyle(
                      color: ColorManager.hinttextdarkColor, fontSize: 12.mv)),
            ),
            Divider(color: ColorManager.grey),
            ListTile(
              onTap: (() {}),
              leading: SvgPicture.asset(ImageAssets.locationPostIcon),
              title: Text("Location",
                  style: getmediumStyle(
                      color: ColorManager.hinttextdarkColor, fontSize: 12.mv)),
            ),
            Divider(color: ColorManager.grey),
            ListTile(
              onTap: (() {}),
              leading: SvgPicture.asset(ImageAssets.imogePostIcon),
              title: Text("Activity",
                  style: getmediumStyle(
                      color: ColorManager.hinttextdarkColor, fontSize: 12.mv)),
            ),
            Divider(color: ColorManager.grey),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.sizeWidth(context) * 0.06,
                  vertical: 10.0),
              child: CustomButton(
                  color: ColorManager.primary,
                  text: "POST",
                  style: getboldStyle(
                    color: ColorManager.white,
                    fontSize: AppSize.s12.mv,
                  ),
                  onTap: () {}),
            ),
          ],
        ),
      ),
    );
  }

  Widget inputFiled() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLines: 3,
        style: TextStyle(color: ColorManager.white),
        decoration: InputDecoration(
          //labelText: 'What’s On Your Mind ?',
          hintText: 'What’s On Your Mind ?',

          hintStyle: getsemiboldStyle(color: ColorManager.white),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget listTile() {
    return ListTile(
      leading: CircleAvatar(
        radius: 30.0,
        backgroundImage: AssetImage(ImageAssets.starUserImage4),
      ),
      title: Text("John Doe",
          style: getmediumStyle(color: ColorManager.white, fontSize: 16.mv)),
      subtitle: Text("Public",
          style: getmediumStyle(
              color: ColorManager.hinttextdarkColor, fontSize: 12.mv)),
    );
  }
}
