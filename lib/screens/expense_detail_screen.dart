import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/widgets/detail_row.dart';

class ExpenseDetailScreen extends StatelessWidget {
  const ExpenseDetailScreen({Key? key, required this.snap}) : super(key: key);

  final snap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      // appBar: AppBar(
      //   title: Text('Expense Detail'),
      // ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Text(
                snap['title'],
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 15),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailRow(
                        label: 'Price: ',
                        text: 'RM${snap['price'].toStringAsFixed(2)}',
                      ),
                      DetailRow(
                        label: 'Date: ',
                        text: DateFormat('dd/MM/yyyy')
                            .format(snap['date'].toDate()),
                      ),
                      DetailRow(
                        label: 'Category: ',
                        text: snap['category'],
                      ),
                      DetailRow(
                        isColumn: true,
                        label: 'Description: ',
                        text: snap['description'],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      snap['imageUrl'] != ''
                          ? Image.network(
                              snap['imageUrl'],
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
