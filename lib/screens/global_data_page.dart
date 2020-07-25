import 'package:covid_data_app/api/covid_data_provider.dart';
import 'package:covid_data_app/components/bottomButton.dart';
import 'package:covid_data_app/components/reusable_card.dart';
import 'package:covid_data_app/screens/global_data_graph_page.dart';
import 'package:covid_data_app/screens/states_list.dart';
import 'package:covid_data_app/utils/constants.dart';
import 'package:covid_data_app/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

final dateList = [
  "Jan 22",
  "Jan 23",
  "Jan 24",
  "Jan 25",
  "Jan 26",
  "Jan 27",
  "Jan 28",
  "Jan 29",
  "Jan 30",
  "Jan 31",
  "Feb 01",
  "Feb 02",
  "Feb 03",
  "Feb 04",
  "Feb 05",
  "Feb 06",
  "Feb 07",
  "Feb 08",
];

final covidDataList = [
  580,
  845,
  1317,
  2015,
  2800,
  4581,
  6058,
  7813,
  9823,
  11950,
  14553,
  17391,
  20630,
  24545,
  28266,
  31439,
  34876,
  37552,
];

class GlobalDataPage extends StatelessWidget {
  TimeSeriesCovidData _createTimeSeriesCovidData(String dateString, int data) {
    // var dateString = 'Mar 07';
    DateFormat format = new DateFormat("MMM dd");
    var formattedDate = format.parse(dateString);
    return TimeSeriesCovidData(
      data: data,
      date: DateTime(2020, formattedDate.month, formattedDate.day),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CovidDataProvider>(
      builder: (context, covidDataProvider, child) {
        if (covidDataProvider.globalData == null)
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 5,
            ),
          );
        else
          return Scaffold(
            appBar: AppBar(
              title: Text(
                '${covidDataProvider.globalData.timeStamp}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: Colors.white12,
                    cardChild: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text(
                            'CORONAVIRUS CASES',
                            style: kLabelTextStyle,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          '${covidDataProvider.globalData.total}'
                              .replaceAllMapped(reg, mathFunc),
                          style: kNumberTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: Colors.white12,
                    cardChild: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text('DEATHS', style: kLabelTextStyle
                              // f40404
                              ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          '${covidDataProvider.globalData.closedCases.deaths}'
                              .replaceAllMapped(reg, mathFunc),
                          style: kNumberTextStyle.copyWith(
                            color: Color(0xFFFF0404),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: Colors.white12,
                    cardChild: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text(
                            'RECOVERED',
                            style: kLabelTextStyle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30.0),
                          child: Text(
                            '${covidDataProvider.globalData.closedCases.recovered}'
                                .replaceAllMapped(reg, mathFunc),
                            style: kNumberTextStyle.copyWith(
                                color: Color(0xFF1FF000)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                BottomButton(
                  buttonTitle: 'SHOW DATA BY STATE',
                  onTap: () {
                    List<TimeSeriesCovidData> list = [];
                    for (int i = 0; i < covidDataList.length; i++) {
                      list.add(_createTimeSeriesCovidData(
                          dateList[i], covidDataList[i]));
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CovidTimeSeriesChart.initWithCovidData(list),
                      ),
                    );
                  },
                )
              ],
            ),
          );
      },
    );
  }
}
