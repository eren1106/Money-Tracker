import 'package:flutter/material.dart';
import 'package:money_tracker/widgets/expenses_pie_chart.dart';

class ReportScreen extends StatefulWidget {
  ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ExpensesPieChart(),)
    );
  }
}