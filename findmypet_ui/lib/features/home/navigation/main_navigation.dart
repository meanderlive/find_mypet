import 'package:findmypet/core/appcolor/app_colors.dart';
import 'package:findmypet/features/home/accountscreen/account_screen.dart';
import 'package:findmypet/features/home/addscreen/add_screen.dart';
import 'package:findmypet/features/home/homescreen/presentation/home_screen.dart';
import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;
  final List<Widget> _pages = [HomeScreen(), AddPetScreen(), AccountScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        selectedItemColor: CAppColors.buttonColor,
        unselectedItemColor: CAppColors.accentColor,
        backgroundColor: CAppColors.accent4Color,
      ),
    );
  }
}
