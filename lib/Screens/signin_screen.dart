import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

import 'package:new_crypto_app/Screens/signup_screen.dart';
import 'package:new_crypto_app/Widgets/input_field.dart';
import 'package:new_crypto_app/main.dart';

class SignIN extends StatefulWidget {
  const SignIN({Key? key}) : super(key: key);

  @override
  _SignINState createState() => _SignINState();
}

class _SignINState extends State<SignIN> {
  TextEditingController _EmailTextController = TextEditingController();
  TextEditingController _PasswordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 223, 210, 210),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              input_textField('Enter Email', Icons.person_3_rounded, false,
                  _EmailTextController),
              SizedBox(
                height: 20,
              ),
              input_textField(
                  'Enter Password', Icons.lock, true, _PasswordTextController),
              SizedBox(
                height: 50,
              ),
              SignButton(context, true, () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _EmailTextController.text,
                        password: _PasswordTextController.text)
                    .then((value) {
                  print("Login Successful!");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(),
                    ),
                  );
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              }),
              SignOption(),
            ],
          ),
        ),
      ),
    );
  }

  Row SignOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            const Text(
              'Dont Have account yet?',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUP(),
                  ),
                );
              },
              child: const Text(
                'Create Account',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
