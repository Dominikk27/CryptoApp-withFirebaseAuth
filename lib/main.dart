import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:new_crypto_app/Screens/settings_screen.dart';
import 'package:new_crypto_app/Widgets/navbar.dart';

import 'package:new_crypto_app/Screens/CoinList.dart';
import 'package:new_crypto_app/Screens/user_screen.dart';

import 'package:new_crypto_app/Screens/signin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto App',
      home: const SignIN(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 1;

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Crypto App',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF2C2C2C),
        toolbarHeight: 90.0,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          SettingsScreen(),
          CoinListView(),
          UserScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onChange: _changeTab,
      ),
    );
  }
}
