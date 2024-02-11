
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SingleTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final FocusNode?  focusNode;
  final bool readOnly;
  final VoidCallback? onEditingCompleted;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool isMulti;
  final bool autofocus;
  final bool enabled;
  final String? errorText;
  final String? label;
  final Widget? suffix;
  final Widget? prefix;
  final String? hintText;

  const SingleTextField(
      {super.key, this.controller,
        this.validator,
        this.keyboardType = TextInputType.text,
        this.focusNode,
        this.isMulti = false,
        this.readOnly = false,
        this.autofocus = false,
        this.errorText,
        this.label,
        this.suffix,
        this.prefix,
        this.enabled = true,
        this.onEditingCompleted,
        this.hintText,
        this.onSubmitted,
        this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50.0,
      child: TextField(
        controller:controller ,
        style: TextStyle(
          color: Colors.white
        ),
        focusNode: focusNode,
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        // onChanged: (String newVal) {
        //   if (newVal.length == 1) {
        //     f2.requestFocus();
        //   }
        // },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 19,vertical: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(width: 1.0),
          ),
        ),
      ),
    );
  }
}
