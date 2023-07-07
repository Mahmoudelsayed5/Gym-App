import 'package:flutter/material.dart';
import 'package:gym_app/Admin.dart';
import 'package:gym_app/Exercise.dart';
import 'package:gym_app/nutrition_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Exercise(),
    );
  }
}
