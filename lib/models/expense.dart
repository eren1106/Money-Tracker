import 'package:cloud_firestore/cloud_firestore.dart';

class Expense {
  final String uid;
  final String expenseId;
  final String title;
  final double price;
  final String category;
  final String imageUrl;
  final String description;
  final DateTime date;

  const Expense({
    required this.uid,
    required this.expenseId,
    required this.title,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.description,
    required this.date
  });

  Map<String, dynamic> toJson() => { //convert Expense object to json format
    'uid': uid,
    'expenseId': expenseId,
    'title': title,
    'price': price,
    'category': category,
    'imageUrl': imageUrl,
    'description': description,
    'date': date,
  };

  static Expense fromSnap(DocumentSnapshot snap){ //convert DocumentSnapshot format to Expense object
    var snapshot = snap.data() as Map<String, dynamic>;

    return Expense(
      uid: snapshot['uid'],
      expenseId: snapshot['expenseId'],
      title: snapshot['title'],
      price: snapshot['price'],
      category: snapshot['category'],
      imageUrl: snapshot['imageUrl'],
      description: snapshot['description'],
      date: snapshot['date'],
    );
  }
}