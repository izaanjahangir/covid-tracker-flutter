import 'package:covid_tracker/models/country.dart';
import "package:flutter/material.dart";
import "package:covid_tracker/config/theme_colors.dart";
import "package:covid_tracker/utils/global_helpers.dart";
import 'package:flutter_svg/flutter_svg.dart';

class AppDrawerItem extends StatelessWidget {
  final bool active;
  final Country country;
  final Function onTap;

  AppDrawerItem({this.active = false, this.country, @required this.onTap});

  void handleTap() {
    onTap(country);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: Material(
        color: active ? ThemeColors.white : ThemeColors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          splashColor: ThemeColors.white,
          borderRadius: BorderRadius.circular(20),
          onTap: handleTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset(country.flag,
                          width: 22, semanticsLabel: country.code),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        country.name,
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Text(GlobalHelpers.formatNumbers(country.confirmed),
                    style: TextStyle(fontSize: 13))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
