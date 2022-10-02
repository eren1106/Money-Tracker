import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_tracker/utils/utils.dart';
import 'package:money_tracker/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (email == '' || password == '') {
      showSnackBar('Please fill in all the fields', context);
      return;
    }
    setState(() {
      _isLoading = true;
    });

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      print(_auth.currentUser);
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
            vertical: 90,
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
                label: 'Email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldInput(
                label: 'Password',
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPass: true,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: loginUser,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      : Text(
                          'Log in',
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
}
