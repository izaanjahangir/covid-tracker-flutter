import "package:flutter/material.dart";
import "package:covid_tracker/config/theme_colors.dart";
import 'package:flutter_svg/flutter_svg.dart';

class AppDrawerItem extends StatelessWidget {
  final bool active;

  AppDrawerItem({this.active = false});

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
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/icons/pakistan.svg",
                          width: 22, semanticsLabel: 'pakistan'),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Pakistan",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Text("100000", style: TextStyle(fontSize: 14))
              ],
            ),
          ),
        ),
      ),
    );
  }
}