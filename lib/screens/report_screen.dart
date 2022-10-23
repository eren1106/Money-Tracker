import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/widgets/expenses_pie_chart.dart';

class ReportScreen extends StatefulWidget {
  ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  int _tabIndex = 0;
  List expenses = [];

  Future<void> getExpenses() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('expenses')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    // Get data from docs and convert map to List
    setState(() {
      expenses = querySnapshot.docs.map((doc) => doc.data()).toList();
      print(expenses);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getExpenses();
  }

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
                FutureBuilder(
                    //to pass future to the child
                    future: FirebaseFirestore.instance
                        .collection('expenses')
                        .where('uid',
                            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                        .get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ExpensesPieChart(expensesSnap: (snapshot.data! as dynamic).docs); //use (snapshot.data! as dynamic) to get docs
                    })
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
