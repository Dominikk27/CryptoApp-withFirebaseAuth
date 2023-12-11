import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_crypto_app/Screens/signin_screen.dart';
import 'package:new_crypto_app/Widgets/navbar.dart';
import 'package:get/get.dart';

import 'package:new_crypto_app/models/coin_controller.dart';

class UserScreen extends StatelessWidget {
  UserScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text("Log-out!"),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    print("LogOut Successful!");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignIN(),
                      ),
                    );
                  });
                },
              ),
              Text(
                'User Features',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*
  Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 100,
                height: 100,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.network(controller.coinsList[index].image),
                ),
              ),
            ),
  */
