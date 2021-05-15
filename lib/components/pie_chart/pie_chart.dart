import 'package:covid_tracker/models/country.dart';
import "package:flutter/material.dart";
import "package:covid_tracker/config/theme_colors.dart";
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatefulWidget {
  final Country country;

  PieChart({this.country});

  @override
  _PieChartState createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  String getPercentage(int lower, int higher) {
    String value = ((lower / higher) * 100).toStringAsFixed(2);

    return value + "%";
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final String activeCasesPercentage =
        getPercentage(widget.country.activeCases, widget.country.confirmed);
    final String recoveredPercentage =
        getPercentage(widget.country.recovered, widget.country.confirmed);
    final String deathsPercentage =
        getPercentage(widget.country.deaths, widget.country.confirmed);

    final List<PieData> pieData = [
      PieData(
          "Active cases", widget.country.activeCases, activeCasesPercentage),
      PieData("Recovered", widget.country.recovered, recoveredPercentage),
      PieData("Deaths", widget.country.deaths, deathsPercentage),
    ];

    return Container(
      height: size.height * 0.5,
      child: SfCircularChart(
        palette: [ThemeColors.purple, ThemeColors.lightGreen, Colors.red],
        legend: Legend(
            isVisible: true, textStyle: TextStyle(color: ThemeColors.white)),
        series: <PieSeries<PieData, String>>[
          PieSeries<PieData, String>(
              dataSource: pieData,
              xValueMapper: (PieData data, _) => data.xData,
              yValueMapper: (PieData data, _) => data.yData,
              dataLabelMapper: (PieData data, _) => data.text,
              dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                  useSeriesColor: true,
                  labelPosition: ChartDataLabelPosition.outside)),
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
