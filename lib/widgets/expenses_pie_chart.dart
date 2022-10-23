import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:money_tracker/utils/utils.dart';

class ExpensesPieChart extends StatefulWidget {
  ExpensesPieChart({Key? key, required this.expensesSnap}) : super(key: key);

  List expensesSnap;
  @override
  State<ExpensesPieChart> createState() => _ExpensesPieChartState();
}

class _ExpensesPieChartState extends State<ExpensesPieChart> {
  double _totalExpenses = 0;
  Map<String, double> _expensesMap = HashMap();

  void addExpenses() {
    double totalExpenses = 0;
    for (var expense in widget.expensesSnap) {
      totalExpenses +=
          expense['price']; //add the expense price to totalExpenses every loop

      _expensesMap.update(
        expense['category'],
        (value) =>
            value +
            expense[
                'price'], //if key exist, add the value into the existing value
        ifAbsent: () => expense[
            'price'], //if key not exist, just put in the value to form a new key and value
      );
    }
    _totalExpenses = totalExpenses;
    setState(() {});
  }

  List<Data> _pieData = [];

  void addPieData() {
    setState(() {
      _pieData = _expensesMap.entries
          .map((e) => Data( //key is category, value is price
              name: e.key,
              percent: convertToPercentage(e.value),
              color: categoryColor(e.key)))
          .toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addExpenses();
    addPieData();
  }

  double convertToPercentage(double expense) {
    return expense / _totalExpenses * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flexible(
        //it will overflow infinity to bottom if didnt wrap with flexible
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

  List<PieChartSectionData> getSections() => _pieData
      .asMap()
      .map((index, data) {
        final value = PieChartSectionData(
          color: data.color,
          value: data.percent,
          title: '${data.percent.toStringAsFixed(1)}%',
          titleStyle: const TextStyle(
            fontSize: 16,
          ),
          // radius: 69
        );
        return MapEntry(index, value);
      })
      .values
      .toList();
}

class Data {
  Data({required this.name, required this.percent, required this.color});
  final String name;
  final double percent;
  final Color color;
}
