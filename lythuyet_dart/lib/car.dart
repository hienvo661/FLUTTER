// ignore_for_file: annotate_overrides, unnecessary_this

import 'package:flutter/material.dart';

// ignore_for_file: prefer_initializing_formals
class Car {
  String name;
  int yearOfProduction;
  //This is the constructor
  //Cách 1: new way
  //Car(this.name, this.yearOfProduction);
  // Cách 2:
  Car({
    required this.name,
    required this.yearOfProduction,
  });

  String toString() {
    return '${this.name} - ${this.yearOfProduction}';
  }

  // hàm void -> là hàm không trả về giá trị
  void dosomething() {
    print('hello....');
    // this.HandleEvent;
  }

  // tham số đầu vào được đặt tên
  void sayHello(String personName) {
    print('hello $personName');
  }

  // biến tham chiếu đến hàm
  // Function HandleEvent;
}
