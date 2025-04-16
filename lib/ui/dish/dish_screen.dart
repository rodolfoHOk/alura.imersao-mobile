import 'package:flutter/material.dart';
import 'package:flutter_techtaste/model/dish.dart';
import 'package:flutter_techtaste/ui/_core/widgets/appbar.dart';

class DishScreen extends StatelessWidget {
  final String restaurantName;
  final Dish dish;
  const DishScreen({
    super.key,
    required this.restaurantName,
    required this.dish,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: restaurantName),
      body: Column(children: [Text("to do")]),
    );
  }
}
