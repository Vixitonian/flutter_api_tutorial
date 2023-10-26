// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UniSearchWidget extends StatefulWidget {
  const UniSearchWidget({super.key});

  @override
  State<UniSearchWidget> createState() => _UniSearchWidgetState();
}

class _UniSearchWidgetState extends State<UniSearchWidget> {
  TextEditingController searchInputController = TextEditingController();
  List<dynamic> universityList = [
    {
      "country": "United States",
      "web_pages": ["http://www.marywood.edu"],
      "name": "Marywood University",
      "alpha_two_code": "US",
    },
  ];

  Future getUniversities(String country) async {
    http.Response response = await http.get(
        Uri.parse('http://universities.hipolabs.com/search?country=$country'));
    setState(() {
      universityList = jsonDecode(response.body) as List<dynamic>;
    });

    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('University'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchInputController,
                decoration: InputDecoration(
                    hintText: 'Enter Country',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            SizedBox(
                width: 300,
                child: ElevatedButton(
                    onPressed: () {
                      getUniversities(searchInputController.text);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.school),
                        Text('Get Universities'),
                      ],
                    ))),
            SizedBox(
              height: 800,
              child: ListView.builder(
                  itemCount: universityList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(universityList[index]['name']),
                      subtitle: Text(universityList[index]['web_pages'][0]),
                      trailing: Text(
                        universityList[index]['alpha_two_code'],
                        style: TextStyle(fontSize: 19),
                      ),
                    );
                  }),
            )
          ]),
        ),
      ),
    );
  }
}
