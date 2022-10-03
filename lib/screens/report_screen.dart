import 'package:flutter/material.dart';
import 'package:money_tracker/widgets/expenses_pie_chart.dart';

class ReportScreen extends StatefulWidget {
  ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    tab(context, 0, 'Day', () {}),
                    tab(context, 1, 'Week', () {}),
                    tab(context, 2, 'Month', () {}),
                    tab(context, 3, 'Year', () {}),
                    tab(context, 4, 'Calendar', () {}),
                  ],
                ),
                ExpensesPieChart(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell tab(
      BuildContext context, int index, String label, Function function) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          _tabIndex = index;
        });
        function();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          label,
          style: TextStyle(
            color: _tabIndex == index
                ? Theme.of(context).primaryColor
                : Theme.of(context).secondaryHeaderColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
