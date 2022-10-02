import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String email;
  final String username;
  final List expenses;
  final List earns;

  const User({
    required this.uid,
    required this.email,  
    required this.username,
    required this.expenses,
    required this.earns,
  });

  Map<String, dynamic> toJson() => { //convert User object to json format
    'uid': uid,
    'email': email,
    'username': username,
    'expenses': expenses,
    'earns': earns,
  };

  static User fromSnap(DocumentSnapshot snap){ //convert DocumentSnapshot format to User object
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      uid: snapshot['uid'],
      email: snapshot['email'],
      username: snapshot['username'],
      expenses: snapshot['expenses'],
      earns: snapshot['earns'],
    );
  }
}