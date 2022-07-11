// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, avoid_print, dead_code

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food_app/Widget/RatingStart.dart';
import 'package:food_app/data/data.dart';
import 'package:food_app/fontstyle/fontstyle.dart';
import 'package:food_app/models/food.dart';
import 'package:food_app/models/restaurant.dart';
import 'package:like_button/like_button.dart';

class RestaurantManage extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantManage({Key? key, required this.restaurant}) : super(key: key);

  @override
  State<RestaurantManage> createState() => _RestaurantManageState();
}

class _RestaurantManageState extends State<RestaurantManage> {
  _buildMenuItem(Food menuItem) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 170,
          width: 170,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(menuItem.imageUrl), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Container(
          height: 170,
          width: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                colors: [
                  Colors.black12.withOpacity(0.1),
                  Colors.black12.withOpacity(0.1),
                  Colors.black12.withOpacity(0.2),
                  Colors.black45.withOpacity(0.2),
                ],
                stops: [
                  0.1,
                  0.1,
                  1,
                  0.3,
                ]),
          ),
        ),
        Positioned(
          bottom: 70,
          child: Column(
            children: [
              Text(
                '${menuItem.name}',
                style: Appstyle.h1.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '\$${menuItem.price.toString()}',
                style: Appstyle.h1.copyWith(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Positioned(
          top: 120,
          left: 120,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.yellow[900],
              borderRadius: BorderRadius.circular(30),
            ),
            child: IconButton(
              onPressed: () {
                print('Button Order');
              },
              icon: Icon(Icons.add),
              iconSize: 30,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(widget.restaurant.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        // color: Theme.of(context).primaryColor,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    LikeButton(
                      size: 32,
                      circleColor: CircleColor(
                          start: Color(0xff00ddff), end: Color(0xff0099cc)),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: Color(0xff0099cc),
                        dotSecondaryColor: Color(0xff0099cc),
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.favorite,
                          color: isLiked ? Colors.red : Colors.white,
                          size: 32,
                        );
                      },
                    ),

                    // IconButton(
                    //   onPressed: () {},
                    //   icon: Icon(
                    //     Icons.favorite,
                    //     color: Colors.redAccent,
                    //     size: 35,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${widget.restaurant.name}',
                        style: Appstyle.h1.copyWith(
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        '2 kilomites away',
                        style: Appstyle.h2,
                      ),
                    ]),
                RatingStart(widget.restaurant.rating),
                SizedBox(height: 6),
                Text(
                  '${widget.restaurant.address}',
                  style: Appstyle.h2,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 13),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {},
                  child: Text(
                    'Reviews',
                    style: Appstyle.h2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 13),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {},
                  child: Text(
                    'Contact',
                    style: Appstyle.h2,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              'Menu',
              style: Appstyle.h1.copyWith(fontSize: 25, letterSpacing: 1),
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(10),
              crossAxisCount: 2,
              children: List.generate(
                widget.restaurant.menu.length,
                (index) {
                  Food food = widget.restaurant.menu[index];
                  return _buildMenuItem(food);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
