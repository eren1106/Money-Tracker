import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_tracker/models/expense.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> addExpense(
    String uid,
    String title,
    String description,
    String category,
    String imageUrl,
    double price,
    DateTime date,
  ) async{
    try{
      String expenseId = const Uuid().v1();
      Expense expense = Expense(
        uid: uid,
        expenseId: expenseId, //assign an unique id to expense's id
        title: title,
        description: description,
        category: category,
        imageUrl: imageUrl,
        price: price,
        date: date,
      );

      await _firestore.collection('expenses').doc(expenseId).set(expense.toJson());
      return 'success';
    }
    catch(e){
      return e.toString();
    }
  }
}