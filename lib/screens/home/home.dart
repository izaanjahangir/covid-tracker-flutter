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

    return SafeArea(
      child: Scaffold(
        drawer: Responsive.isDesktop(context)
            ? null
            : Drawer(
                child: AppDrawer(),
              ),
        body: SingleChildScrollView(
          child: Container(width: size.width, child: Text("Home")),
        ),
      ),
    );
  }
}
