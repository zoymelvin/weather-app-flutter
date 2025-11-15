import 'package:flutter/material.dart';
import 'package:weather_app_joymelvin/screens/home_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF020617),
        
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: const Color(0xFFe5e7eb), 
              displayColor: Colors.white,
            ),

        cardTheme: CardThemeData(
          color: const Color(0xFF0f172a), 
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: const Color(0xFF94a3b8).withOpacity(0.3),
            ),
          ),
        ),
      ),
      
      home: const HomeScreen(),
    );
  }
}