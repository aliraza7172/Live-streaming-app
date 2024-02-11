import 'package:stream_up_live/presentation/resources/index_manager.dart';
import 'package:flutter/material.dart';

Widget imageSouceSheet({
  required VoidCallback onCameraPressed,
  required VoidCallback onGalleryPressed,
  required BuildContext context,
}) {
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: <Color>[
          ColorManager.primary,
          ColorManager.primary,
        ],
      ),
    ),
    child: SafeArea(
      child: Wrap(
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.camera_enhance,
              color: Colors.white,
            ),
            title: Text(
              AppStrings.CAMERA,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white),
            ),
            onTap: onCameraPressed,
          ),
          Divider(color: Colors.white),
          ListTile(
              leading: Icon(
                Icons.image,
                color: Colors.white,
              ),
              title: Text(
                AppStrings.GALLERY,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white),
              ),
              onTap: onGalleryPressed)
        ],
      ),
    ),
  );
}
