// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:food_app/Widget/RatingStart.dart';
import 'package:food_app/data/data.dart';
import 'package:food_app/fontstyle/fontstyle.dart';
import 'package:food_app/models/restaurant.dart';

class RestaurantManage extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantManage({Key? key, required this.restaurant}) : super(key: key);

  @override
  State<RestaurantManage> createState() => _RestaurantManageState();
}

class _RestaurantManageState extends State<RestaurantManage> {
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
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.redAccent,
                        size: 35,
                      ),
                    ),
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
          )
        ],
      ),
    );
  }
}
