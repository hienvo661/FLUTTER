import 'package:flutter/material.dart';

class RatingStart extends StatelessWidget {
  final int rating;
  RatingStart(this.rating);

  @override
  Widget build(BuildContext context) {
    String Stars = '';
    for (int i = 0; i < rating; i++) {
      Stars += '⭐ ';
    }
    ;
    Stars.trim();
    return Text(
      '$Stars',
      style: TextStyle(fontSize: 17),
    );
  }
}
