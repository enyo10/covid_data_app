import 'package:covid_data_app/models/cases.dart';
import 'package:covid_data_app/utils/constants.dart';
import 'package:covid_data_app/utils/resource.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static CovidResource<GlobalData> fetchGlobalData() {
    return CovidResource(
        url: kGlobalCovidDataUrl,
        parse: (response) {
          final result = json.decode(response.body);

          return GlobalData.fromJson(result);
        });
  }
}
