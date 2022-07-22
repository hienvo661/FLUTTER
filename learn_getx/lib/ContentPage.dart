// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/Screen%20Show%20All/ShowRecent.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  //read data file json
  List list = [];
  List info = [];
  _readData() async {
    await DefaultAssetBundle.of(context).loadString("json/recent.json").then(
          (value) => {
            setState(
              () {
                list = json.decode(value);
              },
            ),
          },
        );
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int _currentIndex = 0;

    return Scaffold(
      body: info.isEmpty
          ? Container()
          : Container(
              padding: const EdgeInsets.only(top: 70),
              color: Color(0xFFc5e5f3),
              child: Column(
                children: [
                  //james smith
                  Container(
                    width: width,
                    height: 100,
                    margin: const EdgeInsets.only(left: 25, right: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFebf8fd),
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                AssetImage(info[_currentIndex]['img']),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                info[_currentIndex]['name'],
                                style: TextStyle(
                                    color: Color(0xFF3b3f42),
                                    fontSize: 18,
                                    decoration: TextDecoration.none),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Top Level",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                    decoration: TextDecoration.none),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFFf3fafc)),
                            child: Center(
                              child: Icon(
                                Icons.notifications,
                                color: Color(0xFF69c5df),
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //popular contest
                  Container(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      children: [
                        Text(
                          "Popular Contest",
                          style: TextStyle(
                              color: Color(0xFF1f2326),
                              fontSize: 20,
                              decoration: TextDecoration.none),
                        ),
                        Expanded(child: Container()),
                        Text(
                          "Show all",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              decoration: TextDecoration.none),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFfdc33c)),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                          onTap: () {
                            print('show all1');
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //list
                  Container(
                    height: 220,
                    child: PageView.builder(
                        controller: PageController(viewportFraction: 0.88),
                        itemCount: info.length,
                        itemBuilder: (_, int index) {
                          return GestureDetector(
                            onTap: () {
                              //truyền dữ liệu qua detailPage
                              Get.toNamed(
                                "/detail/",
                                arguments: {
                                  'data': jsonEncode(info[index]),
                                  // 'title': info[index]['title'].toString(),
                                  // 'text': info[index]['text'].toString(),
                                  // 'name': info[index]['name'].toString(),
                                  // 'img': info[index]['img'].toString(),
                                  // 'time': info[index]['time'].toString(),
                                  // 'price': info[index]['price'].toString(),
                                },
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              height: 220,
                              width: MediaQuery.of(context).size.width - 20,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: index.isEven
                                      ? Color.fromARGB(255, 105, 223, 205)
                                      : Color(0xFF9294cc)),
                              child: Column(
                                children: [
                                  Container(
                                      child: Row(
                                    children: [
                                      Text(
                                        info[index]['title'],
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
                                    width: width,
                                    child: Text(
                                      info[index]['text'],
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFFb8eefc)),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Divider(
                                      thickness: 2.0, color: Colors.black12),
                                  Row(children: [
                                    for (int i = 0; i < info.length; i++)
                                      Container(
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
                          );
                        }),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //recent contests
                  Container(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      children: [
                        Text(
                          "Recent Contests",
                          style: TextStyle(
                              color: Color(0xFF1f2326),
                              fontSize: 20,
                              decoration: TextDecoration.none),
                        ),
                        Expanded(child: Container()),
                        Text(
                          "Show all",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                              decoration: TextDecoration.none),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFfdc33c)),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                          onTap: () {
                            Get.to(() => ShowRecent());
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: list.length,
                        itemBuilder: (_, i) {
                          return Container(
                            width: width,
                            height: 100,
                            margin: const EdgeInsets.only(
                                left: 25, right: 25, bottom: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xFFebf8fd),
                            ),
                            child: list.isEmpty
                                ? Container()
                                : Container(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 40,
                                          backgroundImage:
                                              AssetImage(list[i]['img']),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              list[i]['status'],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                            SizedBox(height: 10),
                                            SizedBox(
                                              width:
                                                  130, //mặc định 170 fix - 130 không lỗi
                                              child: Text(
                                                list[i]['text'],
                                                style: TextStyle(
                                                    color: Color(0xFF3b3f42),
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18,
                                                    decoration:
                                                        TextDecoration.none),
                                              ),
                                            )
                                          ],
                                        ),
                                        Expanded(child: Container()),
                                        Container(
                                          width: 70,
                                          height: 70,
                                          child: Text(
                                            list[i]['time'],
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                                decoration: TextDecoration.none,
                                                color: Colors.black26),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
