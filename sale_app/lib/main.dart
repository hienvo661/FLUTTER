import 'package:flutter/material.dart';
import 'package:sale_app/Src/Pages/auth/SigninScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        // scaffoldBackgroundColor: Colors.white.withAlpha(180),
      ),
      home: SignInScreen(),
    );
  }
}
