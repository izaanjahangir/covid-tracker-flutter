import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static dynamic fetchCountForAllCountries() async {
    final Uri uri = Uri.parse("https://covidapi.info/api/v1/global/latest");

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load countries');
    }
  }

  static dynamic fetchCountryHistoricData(String countryCode) async {
    final Uri uri =
        Uri.parse("https://covidapi.info/api/v1/country/$countryCode");

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
