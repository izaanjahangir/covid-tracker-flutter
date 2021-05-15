import 'package:covid_tracker/config/theme_colors.dart';
import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  final String label;
  final bool loading;
  final Widget child;
  final Color color;
  final double iconSize;
  final double labelFontSize;

  Loading(
      {this.color = ThemeColors.grey,
      this.label = "Please wait",
      this.iconSize = 100,
      this.labelFontSize = 22,
      this.loading = true,
      @required this.child});

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Container(
        color: ThemeColors.secondary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitHourGlass(
              color: color,
              size: iconSize,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              label,
              style: TextStyle(color: color, fontSize: labelFontSize),
            )
          ],
        ),
      );
    }

    return child;
  }
}
