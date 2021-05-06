import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final List<ChartData> chartData = [
    ChartData('Unknown', 25),
    ChartData('Other', 38),
    ChartData('Media', 34),
    ChartData('Document', 52),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).secondaryHeaderColor,
        body: SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              height: 300,
              width: 350,
              child: SfCircularChart(series: <DoughnutSeries>[
                // Render pie chart
                DoughnutSeries<ChartData, String>(
                    dataSource: chartData,
                    pointColorMapper: (ChartData data, _) => data.color,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    dataLabelSettings: DataLabelSettings(isVisible: true)),
                    
              ])),
        ));
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color color;
}
