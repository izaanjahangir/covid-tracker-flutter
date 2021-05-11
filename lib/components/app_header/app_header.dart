import "package:flutter/material.dart";
import "package:covid_tracker/config/theme_colors.dart";
import 'package:touchable_opacity/touchable_opacity.dart';

class AppHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void openDrawer() {
      Scaffold.of(context).openDrawer();
    }

    return Container(
      width: double.infinity,
      height: 50,
      color: ThemeColors.purple,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          TouchableOpacity(
            onTap: openDrawer,
            child: Icon(
              Icons.menu,
              size: 25,
              color: ThemeColors.white,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Pakistan (10000)",
            style: TextStyle(fontSize: 18, color: ThemeColors.white),
          ),
        ],
      ),
    );
  }
}
