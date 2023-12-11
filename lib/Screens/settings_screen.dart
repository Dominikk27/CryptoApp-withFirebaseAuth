import 'package:flutter/material.dart';
import 'package:new_crypto_app/Widgets/navbar.dart';
import 'package:get/get.dart';

import 'package:new_crypto_app/models/coin_controller.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({
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
              Text(
                'Settings Features',
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
