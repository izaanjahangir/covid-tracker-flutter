import 'package:flutter/material.dart';

class Country {
  final String name;
  final String flag;
  final String code;
  final int confirmed;
  final int deaths;
  final int recovered;

  Country(
      {@required this.name,
      @required this.flag,
      @required this.code,
      this.confirmed,
      this.deaths,
      this.recovered});

  void printData() {
    print("----- Country: ${this.name} -----");
    print("confirmed: ${this.confirmed}");
    print("deaths: ${this.deaths}");
    print("recovered: ${this.recovered}");
  }
}
