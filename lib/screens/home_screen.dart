import 'package:flutter/material.dart';
import 'package:money_tracker/theme/app_theme.dart';
import 'package:money_tracker/widgets/expenses_cards_container.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home'),
      //   backgroundColor: Theme.of(context).backgroundColor,
      // ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ExpensesCardsContainer(),
      ),
    );
  }
}
