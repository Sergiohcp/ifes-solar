import 'package:flutter/material.dart';
import 'package:ifes_solar/core/solar_colors.dart';
import 'package:ifes_solar/core/solar_text_styles.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? style;

  const CustomFormField(
      {Key? key,
      required this.controller,
      required this.validator,
      this.obscureText = false,
      this.hintText = '',
      this.hintStyle,
      this.style,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      cursorColor: SolarColors.primary,
      style: style ?? TextStyle(color: SolarColors.primary),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle ?? SolarTextStyles.customFormFieldPlaceholder,
          contentPadding: const EdgeInsets.all(18),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: SolarColors.primary)),
          suffixIcon: suffixIcon),
      validator: validator,
      obscureText: obscureText,
    );
  }
}
