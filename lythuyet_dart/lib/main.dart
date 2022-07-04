// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'calculator.dart';
import 'car.dart';

void main() {
  // for (int i = 0; i < number.length; i++) {
  //   print(number[i]);
  // }
  stringnumber.forEach((str) {
    print(str);
  });
  /*var myCar =
      Car(name: 'Mercedes-AMG G 63', yearOfProduction: 2020); //flutter style'
  myCar.HandleEvent = () {
    print('handle event my car');
  };
  myCar.dosomething;
  myCar.sayHello('Hiện');
  */
  // List of car
  List<Car> Cars = <Car>[
    Car(name: 'Mercedes AMG G63', yearOfProduction: 2015)
  ]; //blank list
  //add list
  Cars.add(Car(name: 'Mercedes AMG G63', yearOfProduction: 2020));
  Cars.add(Car(name: 'Mayback', yearOfProduction: 2018));
  Cars.add(Car(name: 'Lamboghini GS', yearOfProduction: 2021));
  Cars.add(Car(name: 'Lamboghini', yearOfProduction: 2012));
  //sắp xếp theo năm
  // Cars.sort((car1, car2) => car1.yearOfProduction - car2.yearOfProduction); // tăng dần
  // Cars.sort((car1, car2) => car2.yearOfProduction - car1.yearOfProduction); // giảm dần
  // sắp xếp theo tên
  //Cars.sort((car1, car2) => car1.name.compareTo(car2.name)); //theo bảng chữ cái
  // update item
  Cars[0].yearOfProduction = 2010; //update năm sản xuất phần tử thứ 0
  Cars[4].yearOfProduction = 2020;
  // lọc dữ liệu lấy ra xe năm sản xuất 2020, và lọc theo tên
  // var filtercar = Cars.where((car) =>
  //         car.yearOfProduction == 2020 && car.name.toUpperCase().contains("L"))
  //     .toList();
  // delete item sử dụng filter
  Cars = Cars.where((element) => element.name != "Lamboghini GS").toList();
  // Lấy ra danh sách tên
  List<String> names = Cars.map((car) => car.name).toList();
  //final và const không thể tham chiếu tới mảng khác, final có thể thêm, const không thể thêm.
  // final List<int> numbers = [1,2,3,6,7,3]; // final không thể tham chiếu tới mảng khác
  // numbers.add(7); // có thể thêm phần tử vào mảng
  // numbers[1] = 77;
  // Kiểu dữ liệu Map
  Map<String, dynamic> personA = Map(); // key: String, Value: String, dymanic, object
  personA['name'] = 'Hiện';
  personA['age'] = 22; // muốn dùng kiểu số Value ta đổi thành dymanic, object 
  Map<double, double> point = Map(); // có thể thêm nhiều cặp key-value, dùng kiểu này để vẽ đồ thị
  point[2.0] = 3.2;
  point[1.0] = 5.2;
  runApp(Center(
      child: Text(
    personA.toString(),
    // '$Cars',
    style: TextStyle(fontSize: 20),
    textDirection: TextDirection.ltr,
  )));
}
