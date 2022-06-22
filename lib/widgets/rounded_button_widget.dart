import 'package:flutter/material.dart';
import 'package:ifes_solar/core/solar_colors.dart';
import 'package:ifes_solar/core/solar_text_styles.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double width;
  final bool isLoading;

  const RoundedButton(
      {Key? key,
      required this.text,
      required this.onTap,
      this.width = 200,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: SolarColors.primary,
        onPrimary: SolarColors.secondary,
        fixedSize: Size.fromWidth(width),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        elevation: 2,
      ),
      onPressed: onTap,
      child: !isLoading
          ? Text(
              text,
              style: SolarTextStyles.roundedButtonText,
            )
          : Container(
              width: 15,
              height: 15,
              child: CircularProgressIndicator(
                  color: SolarColors.white, strokeWidth: 2),
            ),
    );
  }
}
