import 'dart:ffi';

import 'package:f2_flutter_ecommerce_app/pages/home_page.dart';
import 'package:f2_flutter_ecommerce_app/values/app_assets.dart';
import 'package:f2_flutter_ecommerce_app/values/app_colors.dart';
import 'package:f2_flutter_ecommerce_app/values/app_styles.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome to",
                  style: AppStyles.h3,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "English",
                        style: AppStyles.h2.copyWith(
                          color: AppColors.blackGrey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        'Qouste"',
                        style: AppStyles.h4.copyWith(
                          height: 0.2,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: MaterialButton(
                  color: Color.fromARGB(255, 130, 192, 243),
                  shape: CircleBorder(),
                  focusColor: AppColors.lighBlue,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => Homepage()),
                        (route) => false);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Homepage()),
                    // );
                  },
                  child: Image.asset(AppAssets.rightArrow),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
