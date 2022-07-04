// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Myapp extends StatelessWidget {
  String name;
  int age;
  Myapp({required this.name, required this.age});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'This is my first app',
        home: Scaffold(
          body: Center(
            child: Text('Name: ${this.name}, Age: ${this.age}',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Color.fromARGB(166, 30, 183, 200),
                ),
                textDirection: TextDirection.ltr),
          ),
        ));
  }
}
