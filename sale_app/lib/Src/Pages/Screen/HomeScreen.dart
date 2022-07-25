// ignore_for_file: prefer_const_constructors

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:sale_app/Src/Pages/Screen/Components/CategoryTitle.dart';
import 'package:sale_app/Src/Pages/Screen/Components/itemTitle.dart';
import 'package:sale_app/Src/Pages/Values/custom_color.dart';
import 'package:sale_app/Src/Pages/Values/custom_text.dart';
import 'package:sale_app/Src/Pages/Values/app_data.dart' as appData;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategogies = 'cauliflower';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: GestureDetector(
              onTap: () {
                print('Cart');
              },
              child: Badge(
                badgeColor: Colors.red,
                shape: BadgeShape.circle,
                animationType: BadgeAnimationType.scale,
                badgeContent: Text('2',
                    style: TextStyle(color: Colors.white, fontSize: 12)),
                child: Icon(
                  Icons.shopping_cart,
                  color: Appcolor.backgroundColor,
                ),
              ),
            ),
          ),
        ],
        title: Text.rich(
          TextSpan(
            style: AppStyles.h1.copyWith(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                color: Theme.of(context).primaryColor),
            children: [
              TextSpan(
                text: 'Green',
              ),
              TextSpan(
                  text: 'grocer',
                  style: AppStyles.h1
                      .copyWith(color: Appcolor.logoColor, fontSize: 35))
            ],
          ),
        ),
      ),
      // Container
      body: Container(
        // search
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(Icons.search, size: 21),
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.grey.shade400),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(width: 0, style: BorderStyle.none),
                ),
                isDense: true,
              ),
            ),

            // category

            Container(
              height: 40,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return CategoryTitle(
                      onPress: () {
                        setState(() {
                          selectedCategogies = appData.Categories[index];
                        });
                      },
                      categories: appData.Categories[index],
                      isSelected:
                          appData.Categories[index] == selectedCategogies,
                    );
                  },
                  separatorBuilder: (_, index) => SizedBox(width: 10),
                  itemCount: appData.Categories.length),
            ),

            // Gridview
            Expanded(
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // số lượng cột
                    mainAxisSpacing: 10, // khoảng cách
                    crossAxisSpacing: 10, // khoảng cách
                    childAspectRatio: 9 / 12 // kích thước ô
                    ),
                itemCount: appData.items.length,
                itemBuilder: (_, index) {
                  return itemTitle(
                    item: appData.items[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
