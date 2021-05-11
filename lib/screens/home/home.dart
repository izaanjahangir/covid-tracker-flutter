import 'package:covid_tracker/components/app_drawer/app_drawer.dart';
import 'package:covid_tracker/components/app_header/app_header.dart';
import 'package:covid_tracker/components/line_chart/line_chart.dart';
import 'package:covid_tracker/components/pie_chart/pie_chart.dart';
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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AppHeader(),
                      Responsive(
                          mobile: MobileView(),
                          tablet: DesktopView(),
                          desktop: DesktopView())
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [PieChart(), Expanded(child: LineChart())],
    );
  }
}

class MobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PieChart(),
        SizedBox(
          height: 30,
        ),
        LineChart()
      ],
    );
  }
}
