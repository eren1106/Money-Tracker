import 'package:flutter/material.dart';
import 'package:fluttericon/linecons_icons.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/screens/expense_detail_screen.dart';
import 'package:money_tracker/theme/app_theme.dart';

class ExpensesCard extends StatelessWidget {
  const ExpensesCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  final snap;

  Color categoryColor(String category){
    switch(category){
      case 'Clothing': return AppTheme.colors.clothing;
      case 'Debt': return AppTheme.colors.dept;
      case 'Education': return AppTheme.colors.education;
      case 'Entertainment': return AppTheme.colors.entertainment;
      case 'Food': return AppTheme.colors.food;
      case 'Household': return AppTheme.colors.household;
      case 'Insurance': return AppTheme.colors.insurance;
      case 'Medical': return AppTheme.colors.medical;
      case 'Personal': return AppTheme.colors.personal;
      case 'Transportation': return AppTheme.colors.transportation;
      case 'Utilities': return AppTheme.colors.utilities;
      default: return AppTheme.colors.others;
    }
  }

  IconData categoryIcon(String category){
    switch(category){
      case 'Clothing': return Linecons.t_shirt;
      case 'Debt': return Icons.attach_money;
      case 'Education': return Icons.book;
      case 'Entertainment': return Icons.gamepad_outlined;
      case 'Food': return Icons.dinner_dining_rounded;
      case 'Household': return Icons.house;
      case 'Insurance': return Icons.local_atm_rounded;
      case 'Medical': return Icons.medical_services;
      case 'Personal': return Icons.co_present_rounded;
      case 'Transportation': return Icons.commute; //Icons.directions_car_filled_rounded
      case 'Utilities': return Icons.electric_bolt;
      default: return Icons.auto_awesome  ;
    }
  }
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
