import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_tracker/utils/utils.dart';
import 'package:money_tracker/widgets/text_field_input.dart';
import 'package:money_tracker/models/user.dart' as model;

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  void registerUser() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    if (password != confirmPassword) {
      showSnackBar('password not match with confirm password', context);
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      model.User user = model.User(
        uid: cred.user!.uid,
        email: email,
        username: username,
        expenses: [],
        earns: [],
      );

      await _firestore
          .collection('users')
          .doc(cred.user!.uid)
          .set(user.toJson());
    } catch (e) {
      showSnackBar(e.toString(), context);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset(
                'assets/money_app.svg',
                color: Theme.of(context).primaryColor,
                height: 300,
              ),
              TextFieldInput(
                label: 'Username',
                textInputType: TextInputType.text,
                textEditingController: _usernameController,
              ),
              verticalSizedBox(),
              TextFieldInput(
                label: 'Email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),
              verticalSizedBox(),
              TextFieldInput(
                label: 'Password',
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPass: true,
              ),
              verticalSizedBox(),
              TextFieldInput(
                label: 'Confirm Password',
                textInputType: TextInputType.text,
                textEditingController: _confirmPasswordController,
                isPass: true,
              ),
              verticalSizedBox(),
              ElevatedButton(
                onPressed: registerUser,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      : Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox verticalSizedBox() {
    return const SizedBox(
      height: 20,
    );
  }
}
