import 'package:flutter/material.dart';
import 'package:ifes_solar/core/solar_colors.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final FormFieldValidator<String> validator;
  final bool obscureText;
  final Widget? suffixIcon;

  const CustomFormField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.validator,
      this.obscureText = false,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      cursorColor: SolarColors.primary,
      style: TextStyle(color: SolarColors.primary),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: SolarColors.grayDark,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: SolarColors.gray),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: SolarColors.primary, width: 1.5),
        ),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
      obscureText: obscureText,
    );
  }
}
