import 'package:f2_flutter_ecommerce_app/values/app_assets.dart';
import 'package:f2_flutter_ecommerce_app/values/app_colors.dart';
import 'package:f2_flutter_ecommerce_app/values/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            print('back');
            Navigator.pop(context);
          },
          child: Image.asset(AppAssets.leftArrow),
        ),
        title: Text(
          'Favorites Page',
          style: AppStyles.h4,
        ),
      ),
      body: Container(
        child: Text('hello'),
      ),
    );
  }
}
