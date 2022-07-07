import 'package:flutter/material.dart';
import 'package:ifes_solar/core/solar_colors.dart';
import 'package:ifes_solar/core/solar_text_styles.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double width;
  final bool isLoading;
  final String variant;
  final bool disabled;

  const RoundedButton(
      {Key? key,
      required this.text,
      required this.onTap,
      this.width = 200,
      this.isLoading = false,
      this.variant = 'contained',
      this.disabled = false})
      : super(key: key);

  ButtonStyle? getStyle(String variant, double width) {
    switch (variant) {
      case 'contained':
        return ElevatedButton.styleFrom(
          primary: disabled ? SolarColors.grayDark : SolarColors.primary,
          onPrimary: disabled ? SolarColors.grayDark : SolarColors.primary,
          fixedSize: Size(width, 42),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          elevation: 1,
        );
      case 'outlined':
        return ElevatedButton.styleFrom(
          primary: SolarColors.white,
          onPrimary: SolarColors.white,
          fixedSize: Size(width, 42),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              side: BorderSide(width: 2, color: SolarColors.primary)),
          elevation: 1,
        );
    }
  }

  TextStyle? getTextStyle(String variant) {
    switch (variant) {
      case 'contained':
        return disabled
            ? SolarTextStyles.roundedButtonTextDisabled
            : SolarTextStyles.roundedButtonTextContained;
      case 'outlined':
        return disabled
            ? SolarTextStyles.roundedButtonTextDisabled
            : SolarTextStyles.roundedButtonTextOutlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: getStyle(variant, width),
      onPressed: disabled ? null : onTap,
      child: !isLoading
          ? Text(text, style: getTextStyle(variant))
          : Container(
              width: 15,
              height: 15,
              child: CircularProgressIndicator(
                  color: SolarColors.white, strokeWidth: 2),
            ),
    );
  }
}
