import 'package:flutter/material.dart';

class Country {
  String name;
  String flag;
  String code;
  int confirmed;
  int deaths;
  int recovered;
  int activeCases;

  Country(
      {@required name,
      @required flag,
      @required code,
      confirmed,
      deaths,
      recovered}) {
    this.name = name;
    this.flag = flag;
    this.code = code;

    if (confirmed != null) {
      this.confirmed = confirmed;
    }

    if (deaths != null) {
      this.deaths = deaths;
    }

    if (recovered != null) {
      this.recovered = recovered;
    }

    if (confirmed != null && deaths != null && recovered != null) {
      this.activeCases = confirmed - deaths - recovered;
    }
  }

  void printData() {
    print("----- Country: ${this.name} -----");
    print("confirmed: ${this.confirmed}");
    print("deaths: ${this.deaths}");
    print("recovered: ${this.recovered}");
    print("activeCases: ${this.activeCases}");
  }
}
