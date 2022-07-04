import 'package:f2_flutter_ecommerce_app/packages/quote/quote.dart';
import 'package:flutter/material.dart';
import './pages/landing_page.dart';

void main() async {
  await Quotes().getAll();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    ),
  );
}
