// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:sale_app/Src/Pages/Values/custom_text.dart';

class QuatityScreen extends StatelessWidget {
  final int value;
  final String suffixText;
  final Function(int quatity) result;
  QuatityScreen({
    Key? key,
    required this.value,
    required this.suffixText,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 5,
          offset: Offset(1, 2),
        ),
      ], borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _qualityButton(
              icon: Icons.remove,
              Onpress: () {
                if (value == 1) return;
                int resultCounter = value - 1;
                result(resultCounter);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                '${value} ${suffixText}',
                style: AppStyles.h2,
              ),
            ),
            _qualityButton(
              icon: Icons.add,
              Onpress: () {
                int resultCounter = value + 1;
                result(resultCounter);
              },
            )
            // GestureDetector(
            //   onTap: () {
            //     print('remove');
            //   },
            //   child: Container(
            //     child: Icon(
            //       Icons.remove,
            //       size: 17,
            //     ),
            //     width: 25,
            //     height: 20,
            //     decoration:
            //         BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
            //   ),
            // ),
            // Text(
            //   '1',
            //   style: AppStyles.h2.copyWith(color: Colors.black),
            // ),
            // GestureDetector(
            //   onTap: () {
            //     print('add');
            //   },
            //   child: Container(
            //     child: Icon(
            //       Icons.add,
            //       size: 17,
            //     ),
            //     width: 25,
            //     height: 20,
            //     decoration:
            //         BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class _qualityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback Onpress;
  _qualityButton({
    Key? key,
    required this.icon,
    required this.Onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: Onpress,
        child: Ink(
          height: 25,
          width: 25,
          child: Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
            child: Icon(icon),
          ),
        ),
      ),
    );
  }
}
