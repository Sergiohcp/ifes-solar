import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifes_solar/core/solar_colors.dart';

class HomeListItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isHighlight;

  final double BORDER_WIDTH = 1;
  final double BORDER_RADIUS = 12;

  HomeListItem(
      {Key? key,
      required this.title,
      required this.onTap,
      this.isHighlight = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: SolarColors.white,
          border: Border.all(color: SolarColors.secondary, width: BORDER_WIDTH),
          borderRadius: BorderRadius.all(Radius.circular(BORDER_RADIUS)),
          boxShadow: [
            BoxShadow(
              color: SolarColors.grayDark.withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 3,
              offset: Offset(0, 0.5), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title,
                    style: TextStyle(
                        color: isHighlight
                            ? SolarColors.primary
                            : SolarColors.semiBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                  color:
                      isHighlight ? SolarColors.primary : SolarColors.semiBlack,
                )
              ]),
        ),
      ),
    );
  }
}
