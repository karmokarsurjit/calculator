import 'package:calculator/ui/calculator_ui.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorUi(),
    );
  }
}