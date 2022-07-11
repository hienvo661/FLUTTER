import 'package:flutter/material.dart';
import 'package:food_app/Widget/RatingStart.dart';
import 'package:food_app/Widget/Restaurant_manage.dart';
import '../data/data.dart';
import '../fontstyle/fontstyle.dart';
import '../models/restaurant.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  _buildRestaurantPage() {
    List<Widget> restaurantList = [];
    restaurants.forEach(
      (Restaurant restaurant) {
        restaurantList.add(
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RestaurantManage(restaurant: restaurant),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Hero(
                      tag: restaurant.imageUrl,
                      child: Image(
                        height: 130,
                        width: 130,
                        image: AssetImage(restaurant.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            restaurant.name,
                            style: Appstyle.h1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),

                          RatingStart(restaurant.rating),

                          SizedBox(height: 4),
                          Text(
                            restaurant.address,
                            style: Appstyle.h2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),
                          // ignore: prefer_const_constructors
                          Text(
                            '2 kilomites away',
                            style: Appstyle.h2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
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

  @override
  Widget build(BuildContext context) {
    return _buildRestaurantPage();
  }
}
