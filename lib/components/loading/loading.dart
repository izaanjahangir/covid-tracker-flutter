import 'package:covid_tracker/config/theme_colors.dart';
import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  final String label;
  final bool loading;
  final Widget child;

  Loading(
      {this.label = "Please wait", this.loading = true, @required this.child});

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitHourGlass(
            color: ThemeColors.grey,
            size: 100,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            label,
            style: TextStyle(color: ThemeColors.grey, fontSize: 22),
          )
        ],
      );
    }

    return child;
  }
}
