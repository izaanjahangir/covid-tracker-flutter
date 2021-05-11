import "package:flutter/material.dart";
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final _tooltipBehavior = TooltipBehavior(enable: true);

    return Container(
        height: size.height * 0.5,
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            tooltipBehavior: _tooltipBehavior,
            series: <LineSeries<SalesData, String>>[
              LineSeries<SalesData, String>(
                  dataSource: <SalesData>[
                    SalesData('01-Jan-2020', 35),
                    SalesData('01-Feb-2020', 28),
                    SalesData('01-Mar-2020', 34),
                    SalesData('02-Mar-2020', 12),
                    SalesData('03-Mar-2020', 35),
                    SalesData('04-Mar-2020', 28),
                    SalesData('05-Mar-2020', 34),
                    SalesData('06-Mar-2020', 12),
                    SalesData('07-Mar-2020', 35),
                  ],
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  // Enable data label
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ]));
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
