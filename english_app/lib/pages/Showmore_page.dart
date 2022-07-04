import 'package:auto_size_text/auto_size_text.dart';
import 'package:f2_flutter_ecommerce_app/models/english_today.dart';
import 'package:flutter/material.dart';

import '../values/app_assets.dart';
import '../values/app_colors.dart';
import '../values/app_styles.dart';

class ShowmoreWidgetPage extends StatelessWidget {
  final List<englishtoday> wordss;
  const ShowmoreWidgetPage({Key? key, required this.wordss}) : super(key: key);

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
          alignment: Alignment.center,
          child: GridView.count(
            padding: EdgeInsets.symmetric(horizontal: 8),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            crossAxisCount: 2,
            children: wordss
                .map((e) => Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(14))),
                      child: AutoSizeText(
                        e.noun ?? '',
                        style: AppStyles.h4.copyWith(shadows: [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(3, 2),
                              blurRadius: 2)
                        ]),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                    ))
                .toList(),
          )),
    );
  }
}
