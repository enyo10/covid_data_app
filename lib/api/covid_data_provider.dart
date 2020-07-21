import 'package:covid_data_app/api/api.dart';
import 'package:covid_data_app/api/web_service.dart';
import 'package:covid_data_app/models/cases.dart';
import 'package:flutter/cupertino.dart';

class CovidDataProvider extends ChangeNotifier {
  GlobalData _globalData;

  CovidDataProvider() {
    loadData();
  }

  loadData() async {
    var data = Webservice().load(Api.fetchGlobalData());
    await data.then((value) => _globalData = value);
    notifyListeners();
  }

  GlobalData get globalData {
    return _globalData;
  }
}
