import "package:flutter/material.dart";
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  LineChart({@required this.data});

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
