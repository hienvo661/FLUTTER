import 'package:f2_flutter_ecommerce_app/values/app_colors.dart';
import 'package:f2_flutter_ecommerce_app/values/app_styles.dart';
import 'package:flutter/material.dart';

class drawer_button extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const drawer_button({Key? key, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Container(
          width: double.infinity, // full width
          margin: EdgeInsets.symmetric(horizontal: 18),
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(label,
                style: AppStyles.h5
                    .copyWith(color: AppColors.textColor, fontSize: 19)),
          ),
        ),
      ),
    );
  }
}
