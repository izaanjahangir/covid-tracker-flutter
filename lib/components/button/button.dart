import 'package:covid_tracker/config/theme_colors.dart';
import "package:flutter/material.dart";

class Button extends StatelessWidget {
  final String label;
  final Function onTab;

  Button({@required this.label, @required this.onTab});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: ThemeColors.purple,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTab,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              label,
              style: TextStyle(color: ThemeColors.white, fontSize: 16),
            )),
      ),
    );
  }
}
