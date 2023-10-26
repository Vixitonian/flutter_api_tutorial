// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_api_tutorial/api_screen.dart';
import 'package:flutter_api_tutorial/unisearch_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UniSearchWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}
