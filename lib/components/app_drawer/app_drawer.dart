import 'package:covid_tracker/components/app_drawer/app_drawer_item.dart';
import 'package:covid_tracker/models/country.dart';
import "package:flutter/material.dart";
import "package:covid_tracker/config/theme_colors.dart";

class AppDrawer extends StatelessWidget {
  final List<Country> countries;

  AppDrawer({this.countries});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.lightGreen,
      child: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            color: ThemeColors.white,
            child: Center(
                child: Text(
              "Select country",
              style: TextStyle(fontSize: 16),
            )),
          ),
          Expanded(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...countries
                          .asMap()
                          .entries
                          .map((e) => AppDrawerItem(
                                country: e.value,
                              ))
                          .toList()
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
