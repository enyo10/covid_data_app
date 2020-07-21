import 'package:covid_data_app/api/covid_data_provider.dart';
import 'package:covid_data_app/components/bottomButton.dart';
import 'package:covid_data_app/components/reusable_card.dart';
import 'package:covid_data_app/screens/states_list.dart';
import 'package:covid_data_app/utils/constants.dart';
import 'package:covid_data_app/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GlobalDataPage extends StatelessWidget {
  /*const GlobalDataPage({
    Key key,
    this.globalData,
  }) : super(key: key);
*/

  /* @override
  void initState() {
    super.initState();
    Webservice().load(Api.fetchGlobalData()).then((value) => {
          if (mounted)
            {
              setState(() => {globalData = value})
            }
        });
  }*/

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StatesList(),
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
