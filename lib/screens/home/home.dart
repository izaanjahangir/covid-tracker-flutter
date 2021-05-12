import 'package:covid_tracker/components/app_drawer/app_drawer.dart';
import 'package:covid_tracker/components/app_header/app_header.dart';
import 'package:covid_tracker/components/line_chart/line_chart.dart';
import 'package:covid_tracker/components/loading/loading.dart';
import 'package:covid_tracker/components/pie_chart/pie_chart.dart';
import 'package:covid_tracker/config/constants.dart';
import 'package:covid_tracker/models/country.dart';
import 'package:covid_tracker/screens/home/components/no_country_selected.dart';
import 'package:covid_tracker/utils/api.dart';
import 'package:covid_tracker/utils/responsive.dart';
import "package:flutter/material.dart";

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Country> countries = [];
  Country selectedCountry;
  bool isLoadingCountries = false;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  void fetchData() async {
    try {
      setState(() {
        isLoadingCountries = true;
      });

      List<Country> countriesData = [];

      dynamic data = await Api.fetchCountForAllCountries();
      List<dynamic> result = data["result"];

      result.forEach((element) {
        String currentCode = element.keys.first;

        int foundIndex = Constants.supportedCountries
            .indexWhere((element) => element.code == currentCode);

        if (foundIndex != -1) {
          final Country foundCountry = Constants.supportedCountries[foundIndex];
          final Map countryData = element[currentCode];

          final Country newCountry = Country(
              name: foundCountry.name,
              flag: foundCountry.flag,
              code: foundCountry.code,
              recovered: countryData["recovered"],
              deaths: countryData["deaths"],
              confirmed: countryData["confirmed"]);

          countriesData.add(newCountry);
        }
      });

      setState(() {
        countries = countriesData;
      });
    } catch (e) {
      print("Some error => " + e.toString());
    }

    setState(() {
      isLoadingCountries = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double drawerWidth = size.width;

    Widget getDesktopView() {
      return Row(
        children: [PieChart(), Expanded(child: LineChart())],
      );
    }

    Widget getMobileView() {
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

    Widget getAppDrawer() {
      return Container(
        width: drawerWidth > 250 ? 250 : drawerWidth,
        child: Drawer(
          child: AppDrawer(countries: countries, loading: isLoadingCountries),
        ),
      );
    }

    Widget getContent() {
      return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Container(
              width: double.infinity,
              child: selectedCountry != null
                  ? Responsive(
                      mobile: getMobileView(),
                      tablet: getDesktopView(),
                      desktop: getDesktopView())
                  : NoCountrySelected(),
            ),
          ),
        );
      });
    }

    return SafeArea(
      child: Scaffold(
        drawer: Responsive.isDesktop(context) ? null : getAppDrawer(),
        body: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (Responsive.isDesktop(context)) getAppDrawer(),
              Expanded(
                child: Column(
                  children: [
                    AppHeader(
                      label: "Pakistan (1000)",
                    ),
                    Expanded(
                        child: Loading(loading: false, child: getContent())),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
