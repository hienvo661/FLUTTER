import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/ContentPage.dart';
import 'package:learn_getx/HomePage.dart';
import 'package:learn_getx/DetailPage.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => HomePage()),
        GetPage(name: "/detail", page: () => DetailPage()),
      ],
    );
  }
}
