import "package:flutter/material.dart";
import "package:covid_tracker/config/theme_colors.dart";
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final List<PieData> pieData = [
      PieData("Deaths", 20),
      PieData("Recovered", 10),
      PieData("Total", 30),
    ];

    return Container(
      height: size.height * 0.5,
      child: SfCircularChart(
        palette: [ThemeColors.lightGreen, ThemeColors.purple],
        legend: Legend(isVisible: true),
        series: <PieSeries<PieData, String>>[
          PieSeries<PieData, String>(
              dataSource: pieData,
              xValueMapper: (PieData data, _) => data.xData,
              yValueMapper: (PieData data, _) => data.yData,
              dataLabelMapper: (PieData data, _) => data.text,
              dataLabelSettings: DataLabelSettings(isVisible: true)),
        ],
      ),
    );
  }
}

class PieData {
  PieData(this.xData, this.yData, [this.text]);
  final String xData;
  final num yData;
  final String text;
}
