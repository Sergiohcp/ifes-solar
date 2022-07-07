import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifes_solar/core/solar_colors.dart';
import 'package:ifes_solar/core/solar_text_styles.dart';
import 'package:ifes_solar/models/panel.dart';

class PanelsListItem extends StatelessWidget {
  final Panel panel;
  final Panel selectedPanel;
  final void Function(dynamic value)? onChanged;
  final void Function(Panel value)? onSeeDetails;

  PanelsListItem(
      {Key? key,
      required this.panel,
      required this.selectedPanel,
      required this.onChanged,
      required this.onSeeDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Radio(
                activeColor: SolarColors.primary,
                value: panel,
                groupValue: selectedPanel,
                onChanged: onChanged,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: CachedNetworkImage(
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                  imageUrl: panel.image,
                  placeholder: (context, url) => CircularProgressIndicator(
                    strokeWidth: 1,
                    color: SolarColors.primary,
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                panel.name,
                style: SolarTextStyles.panelListItemTitle,
              )
            ],
          ),
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {
              onSeeDetails!(panel);
            },
            child: Row(
              children: [
                Text(
                  'Detalhes',
                  style: SolarTextStyles.panelListItemButton,
                ),
                SizedBox(
                  width: 4,
                ),
                Icon(
                  Icons.arrow_forward,
                  color: SolarColors.grayDark,
                  size: 16,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
