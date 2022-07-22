import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app_ui/Screen/HomePage.dart';
import 'package:movie_app_ui/Screen/SearchPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;
  final tabs = [
    HomePage(),
    Text("Watch",style: TextStyle(color: Colors.white),),
    SearchPage(),
    Text("Profile",style: TextStyle(color: Colors.white),)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: tabs[_currentIndex]),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedColor: Color(0xffFFB41D1D),
        unSelectedColor: Colors.grey,
        backgroundColor: Colors.black,
        strokeColor: Color(0xffFFB41D1D),
        items: [
          CustomNavigationBarItem(
              icon: Icon(Icons.home_filled)),
          CustomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline_rounded)),
          CustomNavigationBarItem(
              icon: Icon(Icons.search_rounded)),
          CustomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined))
        ],
      ),
    );
  }
}
