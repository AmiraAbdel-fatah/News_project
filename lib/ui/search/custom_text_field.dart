import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../utils/app_style.dart';

typedef MyValidator = String? Function(String?)?;

class CustomTextField extends StatelessWidget {
  Color? borderColor;
  String hintText;
  String? labelText;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  TextStyle? style;
  Widget? prefixIcon;
  Widget? suffixIcon;
  int? maxLines;
  bool obSecureText;
  String? Function(String?)? validator;
  TextEditingController? controller;
  TextInputType? keyboardType;

  CustomTextField(
      {super.key,
      required this.hintText,
      this.keyboardType = TextInputType.text,
      this.controller,
      this.validator,
      this.prefixIcon,
      this.suffixIcon,
      this.hintStyle,
      this.labelText,
      this.labelStyle,
      this.style,
      this.maxLines,
      this.obSecureText = false,
      this.borderColor = AppColors.greyColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      controller: controller,
      maxLines: maxLines ?? 1,
      cursorColor: AppColors.blackColor,
      style: style ?? AppStyles.medium16Black,
      obscureText: obSecureText,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        labelStyle: labelStyle,
        hintStyle: hintStyle ?? AppStyles.medium16Grey,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.greyColor,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.greyColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColors.redColor,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: AppColors.redColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
