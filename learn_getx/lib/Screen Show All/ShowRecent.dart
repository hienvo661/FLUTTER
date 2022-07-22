// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:learn_getx/ContentPage.dart';

class ShowRecent extends StatefulWidget {
  const ShowRecent({Key? key}) : super(key: key);

  @override
  State<ShowRecent> createState() => _ShowRecentState();
}

class _ShowRecentState extends State<ShowRecent> {
  //read data file json
  List info = [];
  _readData() async {
    await DefaultAssetBundle.of(context).loadString("json/detail.json").then(
          (value) => {
            setState(
              () {
                info = json.decode(value);
              },
            ),
          },
        );
  }

  @override
  void initState() {
    _readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: info.isEmpty
          ? Container()
          : Container(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (int i = 0; i < info.length; i++)
                            GestureDetector(
                              onTap: () {
                                //truyền dữ liệu qua detailPage
                                Get.toNamed(
                                  "/detail/",
                                  arguments: {
                                    'data': jsonEncode(info[i]),
                                    // 'title': info[i]['title'].toString(),
                                    // 'text': info[i]['text'].toString(),
                                    // 'name': info[i]['name'].toString(),
                                    // 'img': info[i]['img'].toString(),
                                    // 'time': info[i]['time'].toString(),
                                    // 'price': info[i]['price'].toString(),
                                  },
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 10,
                                    top: 20,
                                    right: 10), //khoảng cách trong
                                height: 250,
                                width: MediaQuery.of(context).size.width - 20,
                                margin: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    top: 30), //khoảng cách ngoài
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: i.isEven
                                        ? Color.fromARGB(255, 105, 223, 205)
                                        : Color(0xFF9294cc)),
                                child: Column(
                                  children: [
                                    Container(
                                        child: Row(
                                      children: [
                                        Text(
                                          info[i]['title'],
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                        Expanded(child: Container())
                                      ],
                                    )),
                                    SizedBox(height: 10),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Text(
                                        info[i]['text'],
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Color(0xFFb8eefc)),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Divider(
                                        thickness: 2.0, color: Colors.black12),
                                    Row(children: [
                                      for (int i = 0; i < info.length; i++)
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              vertical: 15),
                                          width: 50,
                                          height: 50,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      info[i]['img'],
                                                    ),
                                                    fit: BoxFit.cover)),
                                          ),
                                        )
                                    ]),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
