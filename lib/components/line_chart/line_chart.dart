import 'package:covid_tracker/config/theme_colors.dart';
import 'package:covid_tracker/utils/responsive.dart';
import "package:flutter/material.dart";
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  LineChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _tooltipBehavior = TooltipBehavior(enable: true);
    double labelSize = 8;

    if (Responsive.isTablet(context)) {
      labelSize = 10;
    }

    if (Responsive.isDesktop(context)) {
      labelSize = 12;
    }

    return Container(
        height: size.height * 0.5,
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(
                labelStyle:
                    TextStyle(color: ThemeColors.white, fontSize: labelSize)),
            primaryYAxis: CategoryAxis(
                labelStyle:
                    TextStyle(color: ThemeColors.white, fontSize: labelSize)),
            tooltipBehavior: _tooltipBehavior,
            series: <LineSeries<SalesData, String>>[
              LineSeries<SalesData, String>(
                  dataSource: data
                      .map((e) => SalesData(e["date"], e["confirmed"]))
                      .toList(),
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  dataLabelSettings: DataLabelSettings(isVisible: false))
            ]));
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final int sales;
}
