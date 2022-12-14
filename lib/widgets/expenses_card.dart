import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/screens/expense_detail_screen.dart';

import '../utils/utils.dart';

class ExpensesCard extends StatelessWidget {
  const ExpensesCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  final snap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExpenseDetailScreen(snap: snap),
          ),
        );
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: categoryColor(snap['category']),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              categoryIcon(snap['category']),
              size: 30,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    snap['title'],
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        DateFormat('dd/MM/yyyy').format(snap['date'].toDate()), //must have toDate when retrieve from firstore
                      ),
                      Text(
                        'RM${snap['price'].toStringAsFixed(2)}', //toStringAsFixed(2) => 2 decimal place
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
