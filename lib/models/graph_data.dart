import 'package:covid_data_app/utils/helper.dart';

class GraphData {}

class TotalCasesStatData {
  final title;
  final List<dynamic> data;
  final List<dynamic> dates;

  TotalCasesStatData({this.title, this.data, this.dates});

  factory TotalCasesStatData.fromJson(Map<String, dynamic> json) {
    return TotalCasesStatData(
      title: json['title'],
      dates: json['categories'],
      data: json['data'],
    );
  }

  @override
  String toString() {
    return 'TotalCasesStatData{title: $title, data: $data, dates: $dates}';
  }
}
/* {


  "xLabel": "Cases",
  "yLabel": "Total Coronavirus Cases",
  "source": "Worldometer",
  "sourceLink": "www.worldometers.info"
}
*/
