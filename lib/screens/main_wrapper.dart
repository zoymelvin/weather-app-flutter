import 'package:flutter/material.dart';
import 'package:weather_app_joymelvin/screens/home_screen.dart';
import 'package:weather_app_joymelvin/screens/profile_screen.dart';

import '../utils/app_colors.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const profileScreen(),
  ];

  void _onItemTapped(int index){
    setState(() {
     _selectedIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,

        backgroundColor: const Color(0xFF0f172a), 
        selectedItemColor: AppColors.kCardBlueSolid, 
        unselectedItemColor: AppColors.kTextSub, 
        showSelectedLabels: false, 
        showUnselectedLabels: false, 
        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile"),                
        ],
      ),
    );
  }
}