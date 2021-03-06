import 'package:flutter/material.dart';
import 'package:food_app/screen/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Food Delivery App',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[50],
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}
