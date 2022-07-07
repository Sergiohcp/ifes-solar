
import 'package:flutter/cupertino.dart';
import 'package:ifes_solar/models/panel.dart';

class PanelsListItem extends StatelessWidget {
  final List<dynamic> panels;
  final Panel selectedPanel;
  final VoidCallback onTap;

  const PanelsListItem({Key? key, required this.panels, required this.selectedPanel, required this.onTap})

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
