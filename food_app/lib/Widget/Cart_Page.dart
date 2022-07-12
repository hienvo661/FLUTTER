import 'package:flutter/material.dart';
import 'package:food_app/data/data.dart';
import 'package:food_app/fontstyle/fontstyle.dart';
import 'package:food_app/models/order.dart';
import 'package:food_app/models/restaurant.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  _buildCard(Order order) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 150,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  width: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(order.food.imageUrl),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20)),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            '${order.food.name}',
                            style: Appstyle.h1.copyWith(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        // SizedBox(height: 17),
                        Text(
                          '${order.restaurant.name}',
                          style: Appstyle.h2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.8, color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // đoạn này đổi thành iconbutton rồi xử lý sau
                              Text('-',
                                  style: Appstyle.h1
                                      .copyWith(color: Colors.deepOrange[700])),
                              SizedBox(width: 15),
                              Text(
                                '${order.quantity.toString()}',
                                style: Appstyle.h2,
                              ),
                              SizedBox(width: 15),
                              Text(
                                '+',
                                style: Appstyle.h1
                                    .copyWith(color: Colors.deepOrange[700]),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text('\$${order.food.price * order.quantity}',
                      style: Appstyle.h1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    currentUser.cart.forEach((Order order) {
      totalPrice += order.quantity * order.food.price;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart (${currentUser.cart.length})'),
        backgroundColor: Colors.lightBlueAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          if (index < currentUser.cart.length) {
            Order order = currentUser.cart[index];
            return _buildCard(order);
          }
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Estimated Delivery Time: ',
                      style: Appstyle.h1,
                    ),
                    Text(
                      '25 min',
                      style: Appstyle.h2,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Total Cost: ', style: Appstyle.h1),
                    Text('\$${totalPrice.toStringAsFixed(2)}',
                        style: Appstyle.h2.copyWith(color: Colors.green)),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: currentUser.cart.length + 1,
        separatorBuilder: (BuildContext context, int index) {
          // ignore: prefer_const_constructors
          return Divider(
            height: 2,
            color: Colors.grey,
          );
        },
      ),
    );
  }
}
