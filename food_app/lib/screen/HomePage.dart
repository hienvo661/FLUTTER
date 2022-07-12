// ignore_for_file: prefer_const_constructors, deprecated_member_use, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:food_app/Widget/Restaurant_Page.dart';
import 'package:food_app/data/data.dart';
import 'package:food_app/fontstyle/fontstyle.dart';
import '../Widget/RecentOder_Page.dart';
import '../models/restaurant.dart';

class HomePage extends StatefulWidget {
  _buildRestaurantPage() {
    List<Widget> restaurantList = [];
    restaurants.forEach(
      (Restaurant restaurant) {
        restaurantList.add(
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 1,
                color: Colors.green,
              ),
            ),
          ),
        );
      },
    );
    return Column(
      children: restaurantList,
    );
  }

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Food Delivery'),
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Icon(
              Icons.account_circle,
              size: 42,
            ),
          ),
          onPressed: () {},
        ),
        actions: [
          FlatButton(
            onPressed: () {},
            child: Text(
              'Cart(${currentUser.cart.length})',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: ListView(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      borderSide: BorderSide(width: 0.8)),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 25,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.clear,
                      size: 25,
                    ),
                    onPressed: () {},
                  ),
                  hintText: 'Search Food or Restaurants'),
            ),
            RecentOder(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 10),
                  child: Text(
                    'Nearby Restaurants',
                    style: Appstyle.h2.copyWith(
                      fontSize: 24,
                    ),
                  ),
                ),
                RestaurantPage(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
