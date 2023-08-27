import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  EdgeInsetsGeometry? contentPadding;
  // InputDecoration? decoration;
  IconData? prefixIcon;
  double? prefixIconSize;
  Color? prefixIconColor;
  bool showPrefixIcon;
  bool? enable;
  bool showSuffixIcon;
  IconData? suffixIcon;
  double? suffixIconSize;
  int? minLines;
  int? maxLines;
  Color? suffixIconColor;

  // Color? hintColor;
  TextStyle? hintStyle;
  final String? hintText;
  final String? intialvalue;
  final TextInputType keyboardType;
  final bool obscureText;
  final Function(String)? onChanged;
  final VoidCallback? onTap;

  CustomTextField({
    super.key,
    this.contentPadding,
    this.controller,
    // this.decoration,
    this.enable,
    this.prefixIcon,
    this.showPrefixIcon = false,
    this.showSuffixIcon = false,
    this.prefixIconSize,
    this.prefixIconColor,
    this.suffixIconSize,
    this.suffixIconColor,
    this.maxLines,
    this.minLines,
    this.suffixIcon,
    // this.hintColor,
    this.hintStyle,
    this.intialvalue,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: intialvalue,
      controller: controller,
      enabled: enable,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      onTap: onTap,
      minLines: minLines,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 0.7, color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintStyle: hintStyle,
        hoverColor: Colors.red,
        prefixIcon: showPrefixIcon
            ? Icon(
                prefixIcon,
                size: prefixIconSize,
              )
            : null,
        prefixIconColor: prefixIconColor,
        suffixIcon: showSuffixIcon
            ? Icon(
                suffixIcon,
                size: suffixIconSize,
              )
            : null,
        suffixIconColor: suffixIconColor,
        contentPadding: contentPadding,
        border: OutlineInputBorder(
          borderSide:
              BorderSide(width: 0.2, color: Colors.red.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
