import 'package:flutter/material.dart';
import 'package:money_tracker/widgets/expenses_card.dart';

class ExpensesCardsContainer extends StatelessWidget {
  const ExpensesCardsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ExpensesCard(
          icon: Icons.restaurant,
          title: 'Eat at vegan restaurant',
          date: '18/9/2022',
          price: '69',
          color: Colors.green,
        ),
        ExpensesCard(
          icon: Icons.shopping_cart,
          title: 'Eat at vegan restaurant',
          date: '18/9/2022',
          price: '180',
          color: Colors.yellow.shade600,
        ),
        ExpensesCard(
          icon: Icons.restaurant,
          title: 'Eat at vegan restaurant',
          date: '18/9/2022',
          price: '69',
          color: Colors.orange,
        ),
        ExpensesCard(
          icon: Icons.restaurant,
          title: 'Eat at vegan restaurant',
          date: '18/9/2022',
          price: '69',
          color: Colors.red,
        ),
        ExpensesCard(
          icon: Icons.restaurant,
          title: 'Eat at vegan restaurant',
          date: '18/9/2022',
          price: '69',
          color: Colors.blue,
        ),
        ExpensesCard(
          icon: Icons.restaurant,
          title: 'Eat at vegan restaurant',
          date: '18/9/2022',
          price: '69',
          color: Colors.lightBlue,
        ),
        ExpensesCard(
          icon: Icons.restaurant,
          title: 'Eat at vegan restaurant',
          date: '18/9/2022',
          price: '69',
          color: Colors.purple,
        ),
        ExpensesCard(
          icon: Icons.restaurant,
          title: 'Eat at vegan restaurant',
          date: '18/9/2022',
          price: '69',
          color: Colors.grey,
        ),
        ExpensesCard(
          icon: Icons.restaurant,
          title: 'Eat at vegan restaurant',
          date: '18/9/2022',
          price: '69',
          color: Colors.pink,
        ),
      ],
    );
  }
}
