import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_tracker/widgets/text_field_input.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

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
                textEditingController: _emailController,
              ),
              verticalSizedBox(),
              TextFieldInput(
                label: 'Email',
                textInputType: TextInputType.text,
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
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  child: Text(
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