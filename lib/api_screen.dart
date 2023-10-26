// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiScreenWidget extends StatefulWidget {
  const ApiScreenWidget({super.key});

  @override
  State<ApiScreenWidget> createState() => _ApiScreenWidgetState();
}

class _ApiScreenWidgetState extends State<ApiScreenWidget> {
  Map<String, dynamic> fact = {'fact': 'This is a default fact'};
  Future getCatFact() async {
    final http.Response response =
        await http.get(Uri.parse('https://catfact.ninja/fact'));
    print(response.body);
    setState(() {
      fact = jsonDecode(response.body) as Map<String, dynamic>;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('API Tutorial for Cat Facts'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                fact['fact'].toString(),
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                  onPressed: () {
                    getCatFact();
                  },
                  child: Text('Refresh'))
            ],
          ),
        ),
      ),
    );
  }
}
