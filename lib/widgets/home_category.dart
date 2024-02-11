import 'package:flutter/material.dart';

import '../presentation/resources/index_manager.dart';

class HomeCategory extends StatelessWidget {
  final int? selected;
  final Function? callback;
  final List? categories;

  const HomeCategory({Key? key, this.selected, this.callback, this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories!.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => callback!(index),
              child: Container(
                margin: EdgeInsets.only(
                    left: index == AppMargin.m0 ? AppMargin.m5 : AppMargin.m0,
                    right: AppMargin.m15,
                    top: AppMargin.m15,
                    bottom: AppMargin.m8),
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                decoration: BoxDecoration(
                    color: selected == index
                        ? ColorManager.primary
                        : ColorManager.primarydarkdarkColor,
                    borderRadius: BorderRadius.circular(AppSize.s30),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.withOpacity(0.3)),
                    ]),
                child: Center(
                  child: Text(categories![index],
                      style: getmediumStyle(
                        fontSize: AppSize.s12,
                        color: selected == index
                            ? ColorManager.white
                            : ColorManager.hinttextdarkColor,
                      )),
                ),
              ),
            );
          }),
    );
  }
}
