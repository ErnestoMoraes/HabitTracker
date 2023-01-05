import 'package:flutter/material.dart';
import 'package:habittacker/pages/home.page.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  // Havi initializer
  await Hive.initFlutter();

  // Open a box
  await Hive.openBox("Habit_Database");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}
