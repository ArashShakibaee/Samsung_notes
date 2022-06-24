import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:samsung_note/Screens/spash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Samsung Notes',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade200,
          iconTheme: IconThemeData(
            size: 25,
            color: Colors.grey.shade700
          ),
          foregroundColor: Colors.grey.shade800
        ),
        primarySwatch: Colors.deepOrange,
      ),
      home: const SplashScreen(),
    );
  }
}