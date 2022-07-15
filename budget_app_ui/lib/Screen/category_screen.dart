// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:budget_app_ui/Widget/colors_category.dart';
import 'package:budget_app_ui/Widget/radial_painter.dart';
import 'package:budget_app_ui/data/data.dart';
import 'package:budget_app_ui/models/category_model.dart';
import 'package:budget_app_ui/models/expense_model.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;

  CategoryScreen({required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  _buildExpense() {
    List<Widget> expenseList = [];
    widget.category.expenses.forEach(
      (Expense expense) {
        expenseList.add(
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            alignment: Alignment.center,
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('${expense.name}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  Text('-\$${expense.cost.toStringAsFixed(2)}',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        );
      },
    );
    return Column(
      children: expenseList,
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = 0;
    widget.category.expenses.forEach(
      ((Expense expense) {
        totalAmount += expense.cost;
      }),
    );
    final double Amountleft = widget.category.maxAmount - totalAmount;
    final double percent = Amountleft / widget.category.maxAmount;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          '${widget.category.name}',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
            iconSize: 30,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              width: double.infinity,
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 5)
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: CustomPaint(
                foregroundPainter: RadialPainter(
                    backgoundColor: Colors.grey,
                    lineColor: getColor(context, percent),
                    percent: percent,
                    width: 15),
                child: Center(
                  child: Text(
                    '\$${(widget.category.maxAmount - totalAmount).toStringAsFixed(2)}/ \$${widget.category.maxAmount}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            _buildExpense(),
          ],
        ),
      ),
    );
  }
}
