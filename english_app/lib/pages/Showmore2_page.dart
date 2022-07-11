import 'package:auto_size_text/auto_size_text.dart';
import 'package:f2_flutter_ecommerce_app/models/english_today.dart';
import 'package:flutter/material.dart';

import '../values/app_assets.dart';
import '../values/app_colors.dart';
import '../values/app_styles.dart';

class ShowmoreWidgetPage2 extends StatelessWidget {
  final List<englishtoday> wordss;
  const ShowmoreWidgetPage2({Key? key, required this.wordss}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondColor,
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        elevation: 0, //xoá viền dưới của appbar
        title: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Text(
            "English Today",
            style:
                AppStyles.h3.copyWith(color: AppColors.textColor, fontSize: 36),
          ),
        ),
        //inkwell là widget cho phép click sự kiện
        leading: InkWell(
          onTap: () {
            // sự kiện ontap
            print("Open Drawer With Key Global");
            Navigator.pop(context);
          },
          child: Image.asset(AppAssets.leftArrow),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                wordss[index].noun!,
                style: AppStyles.h4.copyWith(color: Colors.blueAccent),
              ),
              leading: Icon(
                Icons.favorite,
                color: wordss[index].isFavorites ? Colors.red : Colors.grey,
              ),
              subtitle: Text(
                wordss[index].quote ?? "Don't have",
                style: TextStyle(color: AppColors.textColor),
              ),
              contentPadding: EdgeInsets.all(10),
            );
          },
          itemCount: wordss.length,
        ),
      ),
    );
  }
}
