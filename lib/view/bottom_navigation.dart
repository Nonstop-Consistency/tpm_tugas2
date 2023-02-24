import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tugas2/utils/formatting.dart';
import 'package:tugas2/view/data_member_screen.dart';
import 'package:tugas2/view/login_screen.dart';

import 'calculator_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;
  static const List<Widget> _widgetOptions = [
    DataMemberScreen(),
    CalculatorScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: hexToColor('12731C'),
        title: const Text('Tugas 2 TPM'),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut().whenComplete(() {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              });
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: hexToColor('12731C'),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Data'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calculate,
            ),
            label: 'Calculator',
          )
        ],
        onTap: (index) {
          setState(
            () {
              selectedIndex = index;
            },
          );
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
      ),
    );
  }
}
