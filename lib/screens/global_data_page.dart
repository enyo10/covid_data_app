import 'package:covid_data_app/components/bottomButton.dart';
import 'package:covid_data_app/components/reusable_card.dart';
import 'package:covid_data_app/screens/states_list.dart';
import 'package:covid_data_app/utils/constants.dart';
import 'package:flutter/material.dart';

class GlobalDataPage extends StatelessWidget {
  const GlobalDataPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid 19 data'),
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
                    '65,775,775',
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
                    '65,775,775',
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
                      '65,775,775',
                      style:
                          kNumberTextStyle.copyWith(color: Color(0xFF1FF000)),
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
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
  }
}
