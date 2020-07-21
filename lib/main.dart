import 'package:covid_data_app/screens/global_data_page.dart';
import 'package:covid_data_app/screens/states_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid data app',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        // textTheme: TextTheme(bodyText2: TextStyle(color: Color(0xFFFFFFFF))),
        //  accentColor: Colors.purple,
      ),
      home: GlobalDataPage(),
    );
    return StatesList();
  }
}
