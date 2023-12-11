import 'package:flutter/material.dart';
import 'package:new_crypto_app/Screens/user_screen.dart';
import 'package:new_crypto_app/Screens/settings_screen.dart';

class BottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onChange;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onChange,
  }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFF2C2C2C),
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.settings),
              color: widget.currentIndex == 0
                  ? Color.fromARGB(255, 54, 243, 33)
                  : Color(0xFFD9D9D9),
              onPressed: () {
                widget.onChange(0);
              },
            ),
            Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.currentIndex == 1
                    ? Color.fromARGB(255, 54, 243, 33)
                    : Color(0xFFD9D9D9),
              ),
              child: IconButton(
                onPressed: () {
                  widget.onChange(1);
                },
                icon: const Icon(
                  Icons.star_rounded,
                  color: Colors.black,
                  size: 30.0,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.account_circle_rounded),
              color: widget.currentIndex == 2
                  ? Color.fromARGB(255, 54, 243, 33)
                  : Color(0xFFD9D9D9),
              onPressed: () {
                widget.onChange(2);
              },
            ),
          ],
        ),
      ),
    );
  }
}
