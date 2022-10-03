import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ExpensesPieChart extends StatefulWidget {
  ExpensesPieChart({Key? key}) : super(key: key);

  @override
  State<ExpensesPieChart> createState() => _ExpensesPieChartState();
}

class _ExpensesPieChartState extends State<ExpensesPieChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flexible( //it will overflow infinity to bottom if didnt wrap with flexible
        child: PieChart(
          PieChartData(
            sections: getSections(),
            sectionsSpace: 0,
            centerSpaceRadius: 90,
            startDegreeOffset: 270,
          ),
        ),
      ),
    );
  }
}

List<PieChartSectionData> getSections() => pieData
    .asMap()
    .map<int, PieChartSectionData>((index, data) {
      final value = PieChartSectionData(
        color: data.color,
        value: data.percent,
        title: '${data.percent}%',
        titleStyle: TextStyle(
          fontSize: 16,
        ),
        // radius: 69
      );
      return MapEntry(index, value);
    })
    .values
    .toList();

List<Data> pieData = [
  Data(name: 'Red', percent: 40, color: Colors.pink),
  Data(name: 'Orange', percent: 30, color: Colors.orange),
  Data(name: 'Yellow', percent: 15, color: Colors.yellow),
  Data(name: 'Green', percent: 15, color: Colors.green),
];

class Data {
  Data({required this.name, required this.percent, required this.color});
  final String name;
  final double percent;
  final Color color;
}
