import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:money_tracker/models/expense.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> addExpense(
    String uid,
    String title,
    String description,
    String category,
    File? imageFile,
    double price,
    DateTime date,
  ) async{
    try{
      String imageUrl = '';
      if(imageFile != null){
        final imageName = imageFile.path.split('/').last; // get the image name
        //ATTENTION: REMEMBER TO GO TO FIRESTORE STORAGE SECTION AND CHANGE THE RULES => 'if false' to 'if true' !!! 
        final ref = FirebaseStorage.instance.ref().child('expenseImages').child(imageName); //get the path in firestore
        await ref.putFile(imageFile); //put image into the path
        imageUrl = await ref.getDownloadURL(); //get the image url
      }

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