// ignore_for_file: deprecated_member_use

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:stream_up_live/controller/edit_profile_controller.dart';
import 'package:stream_up_live/presentation/Mixins/size.dart';
import 'package:stream_up_live/presentation/resources/index_manager.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:stream_up_live/widgets/custom_snackbar.dart';
import 'package:stream_up_live/widgets/text_form_field.dart';

import '../../model/userModel.dart';

class EditProfilModel {
  String? title;
  String? subtitle;
  EditProfilModel({this.title, this.subtitle});
}

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  DateTime? selectedDateTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
        init: EditProfileController(),
        builder: (_) {
          // _.addData();
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
                "Edit Profile",
                style: getsemiboldStyle(
                    color: ColorManager.white, fontSize: AppSize.s16.mv),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 5.0),
                  child: InkWell(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      _
                          .editeProfile(
                              _.user.data!.user!.id.toString(),
                              _.nameController.text.trim(),
                              _.nickNameController.text.trim(),
                              _.selectedGender,
                              "22/05/2000",
                              _.emailController.text.trim(),
                              _.numberController.text.trim(),
                              _.aboutController.text.trim())
                          .then((respons) => {
                                if (respons.isSuccess)
                                  {
                                    showCustomSnackBar(respons.message),
                                    _.editeProfileData(),
                                  }
                                else
                                  {showCustomSnackBar(respons.message)}
                              });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 10.0),
                        child: Center(
                          child: _.isLoading
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 1,
                                )
                              : Text(
                                  "Update",
                                  style: getsemiboldStyle(
                                      color: ColorManager.white,
                                      fontSize: 8.mv),
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: ColorManager.primarydarkdarkColor,
                      borderRadius: new BorderRadius.only(
                        bottomLeft: const Radius.circular(15.0),
                        bottomRight: const Radius.circular(15.0),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Your ID is",
                            style: TextStyle(fontSize: 16.mv,color:Colors.grey ),
                          ),
                          Text(
                            _.user.data!.user!.code.toString(),
                            style: TextStyle(
                                fontSize: 24.mv, color: ColorManager.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 5.0),
                            child: InkWell(
                              onTap: () {
                                Clipboard.setData(ClipboardData(
                                    text: _.user.data!.user!.code.toString()));
                                Fluttertoast.showToast(
                                  msg: 'Text Copied',
                                );
                              },
                              child: Container(
                                width: 90,
                                decoration: BoxDecoration(
                                    color: ColorManager.primary,
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6.0, horizontal: 10.0),
                                  child: Center(
                                    child: Text(
                                      "Copy ID",
                                      style: getsemiboldStyle(
                                          color: ColorManager.white,
                                          fontSize: 12.mv),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // const SizedBox(height: 10.0),),
                    ),
                  ),
                  profileFieldWidget(
                    "Full Name",
                    AppStrings.enterYourName,
                    _.nameController,
                  ),
                  profileFieldWidget(
                    "Nickname (Display Name)",
                    AppStrings.enterNickName,
                    _.nickNameController,
                  ),
                  SizedBox(height: AppSize.s8),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
                    child: Text(
                      "Gender",
                      style: getmediumStyle(
                          color: ColorManager.white, fontSize: AppSize.s12.mv),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: AppSize.s50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorManager.primarydarkColor,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<String>(
                        // value: _.selectedGender,
                        isExpanded: true,
                        underline: SizedBox(),
                        iconEnabledColor: ColorManager.whiteColor,
                        dropdownColor: ColorManager.primarydarkColor,
                        hint: Text(_.selectedGender,style: TextStyle(color: Colors.white),),
                        onChanged: (String? newValue) {
                          _.selectedGender = newValue!;
                          _.update();
                        },
                        items: _.genderOptions
                            .map<DropdownMenuItem<String>>((String gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  14, 14.0, 14.0, 14.0),
                              child: Text(
                                gender,
                                style:
                                    TextStyle(color: ColorManager.whiteColor),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: AppSize.s8),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    child: Text(
                      "Country",
                      style: getmediumStyle(
                          color: ColorManager.white, fontSize: AppSize.s12.mv),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: ColorManager.primarydarkColor,
                        border: Border.all(
                            color: ColorManager.blackBorder.withOpacity(0.2),
                            width: 1.5),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownSearch<UserModelDropDown>(
                      onChanged: (selectedValue) {
                        if (selectedValue != null) {
                          _.selectedDropDownValues = UserModelDropDown(name: selectedValue.name,value:selectedValue.value );
                          _.update();
                        }
                      },
                      dropdownBuilder: (
                          context,
                          itemAsString,
                          ) {
                        return Container(
                          margin :EdgeInsets.only(top: 2) ,
                          child: Text(
                            itemAsString.toString(),
                            style: TextStyle(
                                color: itemAsString != null
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        );
                      },
                      selectedItem: _.selectedDropDownValues,
                      asyncItems: (String? filter) async {
                        if (filter != null && filter.isNotEmpty) {
                          List<UserModelDropDown> allItems =
                              await _.getData(filter);
                          return allItems
                              .where((item) => item.name
                                  .toString()
                                  .toLowerCase()
                                  .contains(filter.toLowerCase()))
                              .toList();
                        } else {
                          // If no filter is provided, return all items
                          return _.getData(filter);
                        }
                      },
                      itemAsString: (UserModelDropDown e) => e.name.toString(),
                      popupProps: PopupPropsMultiSelection.dialog(
                      dialogProps: DialogProps(backgroundColor:  ColorManager.secondarydarkColor,),
                        showSelectedItems: true,
                        itemBuilder: _.customPopupItemBuilderExample2,
                        showSearchBox: true,
                        searchFieldProps: TextFieldProps(style: TextStyle(color: Colors.white))
                      ),
                      compareFn: (item, sItem) => item == sItem.name.toString(),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          filled: true,
                          labelStyle: TextStyle(color: Colors.white),
                          fillColor:
                              Theme.of(context).inputDecorationTheme.fillColor,
                        ),
                      ),
                    ),
                  ),
                  profileFieldWidget(
                    "Mobile Number",
                    AppStrings.enterYourPhoneNumber,
                    _.numberController,
                  ),
                  profileFieldWidget(
                    "Email",
                    AppStrings.enterYourEmailAddress,
                    _.emailController,
                  ),
                  SizedBox(height: AppSize.s8),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
                    child: Text(
                      "Date Of Birth",
                      style: getmediumStyle(
                          color: ColorManager.white, fontSize: AppSize.s12.mv),
                    ),
                  ),
                  SizedBox(height: AppSize.s8),
                  GestureDetector(
                    onTap: () async {
                      _.selectedDOB = await _.selectDateTime(context);
                      _.update();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      // height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: ColorManager.primarydarkColor,
                          border: Border.all(
                              color: ColorManager.blackBorder.withOpacity(0.2),
                              width: 1.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(_.selectedDOB=="null"?"":
                        _.selectedDOB,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  profileFieldWidget(
                    "About You",
                    AppStrings.enterAboutYou,
                    _.aboutController,
                    maxLines: 4
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          );
        });
  }

  Widget StarRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              //"Wealth",
              "Star\t\t\t",
              style:
                  getsemiboldStyle(color: ColorManager.white, fontSize: 14.mv),
            ),
            Container(
              decoration: BoxDecoration(
                color: ColorManager.orangeColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      ImageAssets.heartIcon,
                      height: 8,
                      width: 8,
                    ),
                    SizedBox(width: AppSize.s4),
                    Text(
                      "06",
                      style: getsemiboldStyle(
                          color: ColorManager.white, fontSize: 7.mv),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  "500,000 Beans Up to Next Level",
                  style: getsemiboldStyle(
                      color: ColorManager.white, fontSize: 8.mv),
                ),
                new LinearPercentIndicator(
                  width: 200.0,
                  lineHeight: 14.0,
                  percent: 0.5,
                  backgroundColor: Colors.grey,
                  progressColor: ColorManager.primary,
                  barRadius: Radius.circular(10.0),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: ColorManager.orangeColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      ImageAssets.diamindIcon,
                      height: 8,
                      width: 8,
                    ),
                    SizedBox(width: AppSize.s4),
                    Text(
                      "06",
                      style: getsemiboldStyle(
                          color: ColorManager.white, fontSize: 7.mv),
                    ),
                  ],
                ),
              ),
            ),
            SvgPicture.asset(ImageAssets.forwardIcon),
          ],
        ),
      ),
    );
  }

  Widget WealthRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Wealth",
              style:
                  getsemiboldStyle(color: ColorManager.white, fontSize: 14.mv),
            ),
            Container(
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 4.0),
                  child: Text(
                    "Lv. 3",
                    style: getsemiboldStyle(
                        color: ColorManager.white, fontSize: 7.mv),
                  )),
            ),
            Column(
              children: [
                Text(
                  "500,000 Beans Up to Next Level",
                  style: getsemiboldStyle(
                      color: ColorManager.white, fontSize: 8.mv),
                ),
                new LinearPercentIndicator(
                  width: 200.0,
                  lineHeight: 14.0,
                  percent: 0.5,
                  backgroundColor: Colors.grey,
                  progressColor: ColorManager.primary,
                  barRadius: Radius.circular(10.0),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 4.0),
                  child: Text(
                    "Lv. 4",
                    style: getsemiboldStyle(
                        color: ColorManager.white, fontSize: 7.mv),
                  )),
            ),
            SvgPicture.asset(ImageAssets.forwardIcon),
          ],
        ),
      ),
    );
  }

  Widget customeListTile(EditProfilModel epm, int index) {
    return SizedBox(
      child: ListTile(
        title: Text(epm.title ?? "",
            style: getsemiboldStyle(
                color: ColorManager.hinttextdarkColor, fontSize: 12.mv)),
        subtitle: Text(epm.subtitle ?? "",
            style: getsemiboldStyle(
                color: ColorManager.whiteColor, fontSize: 14.mv)),
        trailing: index == 1
            ? Container(
                decoration: BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: BorderRadius.circular(15.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "COPY",
                    style: getsemiboldStyle(
                        color: ColorManager.white, fontSize: 8.mv),
                  ),
                ),
              )
            : SvgPicture.asset(ImageAssets.forwardIcon),
      ),
    );
  }

  Widget profileFieldWidget(
      String heading, String hintField, TextEditingController controller,
      {bool isReadOnly = false, GestureTapCallback? onTap,int maxLines=1 }) {
    if(controller.text=="null"){
      controller.text="";
    }
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppSize.s8),
          Text(
            heading,
            style: getmediumStyle(
                color: ColorManager.white, fontSize: AppSize.s12.mv),
          ),
          SizedBox(height: AppSize.s8),
          CustomeTextFormField(
            readOnly: isReadOnly,
            horizontalMergin: 0,
            maxLines: maxLines,
            style: TextStyle(color: Colors.white),
            hintText: hintField,
            controller: controller,
            fillColor: ColorManager.primarydarkColor,
            validator: (String? val) {
              if (val == null || val.isEmpty) {
                return AppStrings.enterEmailAddress;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
