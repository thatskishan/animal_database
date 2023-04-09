import 'package:animal_database/views/screens/categories.dart';
import 'package:animal_database/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        // '/': (context) => const AnimalHome(),
        '/': (context) => const SplashScreen(),
        'animal_categories': (context) => const AnimalCategories(),
      },
    ),
  );
}
