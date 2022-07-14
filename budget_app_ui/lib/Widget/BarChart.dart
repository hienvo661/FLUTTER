import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> expense;
  BarChart(this.expense);

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expense.forEach((double price) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    });
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'Weekly Spending',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
                onPressed: () {}, icon: Icon(Icons.arrow_back), iconSize: 30),
            Text(
              'July 10, 2022, - July 16, 2022',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward),
                iconSize: 30),
          ],
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Bar(
              label: 'Sun',
              amountSpent: expense[0],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: 'Mon',
              amountSpent: expense[1],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: 'Tue',
              amountSpent: expense[2],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: 'Wed',
              amountSpent: expense[3],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: 'Thur',
              amountSpent: expense[4],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: 'Fri',
              amountSpent: expense[5],
              mostExpensive: mostExpensive,
            ),
            Bar(
              label: 'Sat',
              amountSpent: expense[6],
              mostExpensive: mostExpensive,
            ),
          ],
        ),
      ],
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpensive;
  final double _maxbarheigh = 150;
  Bar({
    required this.label,
    required this.amountSpent,
    required this.mostExpensive,
  });

  @override
  Widget build(BuildContext context) {
    final Barheigh = amountSpent / mostExpensive * _maxbarheigh;
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              '\$${amountSpent.toStringAsFixed(2)}',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            Container(
              height: Barheigh,
              width: 18,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(7)),
            ),
            SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        )
      ],
    );
  }
}
