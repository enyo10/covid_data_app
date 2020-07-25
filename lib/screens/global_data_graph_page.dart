import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CovidTimeSeriesChart extends StatelessWidget {
  final List<charts.Series<TimeSeriesCovidData, DateTime>> seriesList;

  const CovidTimeSeriesChart(this.seriesList);

  factory CovidTimeSeriesChart.initWithCovidData(
      List<TimeSeriesCovidData> data) {
    return CovidTimeSeriesChart(
      _makeChartSeries(data),
    );
  }

  static List<charts.Series<TimeSeriesCovidData, DateTime>> _makeChartSeries(
      List<TimeSeriesCovidData> data) {
    return <charts.Series<TimeSeriesCovidData, DateTime>>[
      charts.Series<TimeSeriesCovidData, DateTime>(
        id: 'Covid data chart',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesCovidData covidData, _) => covidData.date,
        measureFn: (TimeSeriesCovidData covidData, _) => covidData.data,
        data: data,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID19 DATA CHART'),
      ),
      body: charts.TimeSeriesChart(
        seriesList,
        animate: false,
        dateTimeFactory: const charts.LocalDateTimeFactory(),
        domainAxis: charts.DateTimeAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(
            labelStyle: new charts.TextStyleSpec(
                fontSize: 18, // size in Pts.
                color: charts.MaterialPalette.white),

            // Change the line colors to match text color.
            lineStyle:
                new charts.LineStyleSpec(color: charts.MaterialPalette.white),
          ),
          tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
            day: charts.TimeFormatterSpec(
              format: 'MMMd',
              transitionFormat: 'MMMd',
            ),
          ),
        ),
        primaryMeasureAxis: charts.NumericAxisSpec(
          renderSpec: charts.GridlineRendererSpec(
            // Tick and Label styling here.
            labelStyle: charts.TextStyleSpec(
                fontSize: 18, // size in Pts.
                color: charts.MaterialPalette.white),

            // Change the line colors to match text color.
            lineStyle: charts.LineStyleSpec(
              color: charts.MaterialPalette.white,
            ),
          ),
        ),
      ),
    );
  }
}

class TimeSeriesCovidData {
  final DateTime date;
  final int data;

  TimeSeriesCovidData({@required this.date, @required this.data});
}
