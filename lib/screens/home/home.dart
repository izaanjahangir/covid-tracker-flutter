import 'package:covid_tracker/components/app_drawer/app_drawer.dart';
import 'package:covid_tracker/utils/responsive.dart';
import "package:flutter/material.dart";

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double drawerWidth = size.width;

    return SafeArea(
      child: Scaffold(
        drawer: Responsive.isDesktop(context)
            ? null
            : Container(
                width: drawerWidth > 250 ? 250 : drawerWidth,
                child: Drawer(
                  child: AppDrawer(),
                ),
              ),
        body: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context))
                Container(
                  width: drawerWidth > 250 ? 250 : drawerWidth,
                  child: AppDrawer(),
                ),
              Container(
                child: Text("Home"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
