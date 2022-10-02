import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/widgets/expenses_card.dart';

class ExpensesCardsContainer extends StatelessWidget {
  const ExpensesCardsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('expenses')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, AsyncSnapshot snapshot) { //use AsyncSnapshot type to access docs
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        var expenses = snapshot.data!.docs;
        print(expenses);
        return expenses.length > 0
            ? ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, index) => ExpensesCard(
                  snap: expenses[index].data(),
                ),
              )
            : Center(
                child: Text(
                  'No expense added yet!',
                ),
              );
      },
    );
  }
}
