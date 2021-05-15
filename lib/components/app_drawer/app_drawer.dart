import 'package:covid_tracker/components/app_drawer/app_drawer_item.dart';
import 'package:covid_tracker/components/loading/loading.dart';
import 'package:covid_tracker/models/country.dart';
import "package:flutter/material.dart";
import "package:covid_tracker/config/theme_colors.dart";

class AppDrawer extends StatelessWidget {
  final List<Country> countries;
  final bool loading;
  final Function onCountrySelect;
  final Country selectedCountry;

  AppDrawer(
      {this.countries,
      this.loading,
      @required this.onCountrySelect,
      this.selectedCountry});

  void handleTap(Country c) {
    onCountrySelect(c);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.secondary,
      child: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            color: ThemeColors.primary,
            child: Center(
                child: Text(
              "Select country",
              style: TextStyle(fontSize: 16, color: ThemeColors.white),
            )),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                  child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Loading(
                  color: ThemeColors.white,
                  labelFontSize: 18,
                  label: "Getting countries",
                  iconSize: 60,
                  loading: loading,
                  child: Column(
                    children: [
                      ...countries
                          .asMap()
                          .entries
                          .map((e) => AppDrawerItem(
                                onTap: handleTap,
                                active: selectedCountry != null &&
                                    selectedCountry.code == e.value.code,
                                country: e.value,
                              ))
                          .toList()
                    ],
                  ),
                ),
              ));
            }),
          ))
        ],
      ),
    );
  }
}
