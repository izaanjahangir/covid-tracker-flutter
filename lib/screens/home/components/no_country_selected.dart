import 'package:covid_tracker/components/button/button.dart';
import 'package:covid_tracker/config/theme_colors.dart';
import 'package:covid_tracker/utils/responsive.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';

class NoCountrySelected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void openCountryPicker() {
      Scaffold.of(context).openDrawer();
    }

    final double globeSize = Responsive.isDesktop(context) ? 180 : 130;
    final double fontSize = Responsive.isDesktop(context) ? 22 : 18;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/icons/globe.svg",
          width: globeSize,
          semanticsLabel: "globe",
          color: ThemeColors.white,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "No country selected",
          style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: ThemeColors.white),
        ),
        SizedBox(
          height: 15,
        ),
        Button(label: "Open country picker", onTab: openCountryPicker)
      ],
    );
  }
}
