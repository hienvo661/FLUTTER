// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Myapp1 extends StatefulWidget {
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Myapp1();
  }
}

class _Myapp1 extends State<Myapp1> {
  String _email = ''; //This is state
  final emailEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // thêm state thay đổi giá trị
    return MaterialApp(
        title: "This is my first app",
        home: Scaffold(
          
          body: Center(
              child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // comlum từ trên xuồn dưới
            children: <Widget>[
              
              Container(
                //container có thể thêm các thuộc tính căn chỉnh
                padding: EdgeInsets.symmetric(
                  horizontal: 20, //pading horizontal = left+right
                  vertical: 10, //pading vertical = top + bottom
                ),
                //Một widget TextField cho phép thu thập thông tin từ người dùng
                child: TextField(
                  //lấy giá trị textfield bằng Texteditingcontroller
                  controller: emailEditingController,
                  onChanged: (text) {
                    // ignore: unnecessary_this
                    this.setState(() {
                      _email = text; // change state
                    });
                  },
                  //trang trí cho textfield
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    labelText: "Enter your email",
                  ),
                ),
              ),
              Text(
                _email,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'This is line 2',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )
            ],
          )),
        ));
  }
}
