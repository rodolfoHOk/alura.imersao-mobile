import 'package:flutter/material.dart';
import 'package:flutter_techtaste/model/dish.dart';
import 'package:flutter_techtaste/model/restaurant.dart';
import 'package:flutter_techtaste/ui/_core/app_colors.dart';
import 'package:flutter_techtaste/ui/_core/widgets/appbar.dart';
import 'package:flutter_techtaste/ui/restaurant/widgets/dish_widget.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: restaurant.name),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Center(
              child: ClipOval(
                child: Image.asset(
                  'assets/${restaurant.imagePath}',
                  width: 160,
                ),
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mais pedidos",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.accentTextColor,
                      ),
                    ),
                    SizedBox(height: 8),
                    Column(
                      spacing: 16,
                      children: List.generate(restaurant.dishes.length, (
                        index,
                      ) {
                        Dish dish = restaurant.dishes[index];
                        return DishWidget(
                          restaurantName: restaurant.name,
                          dish: dish,
                        );
                      }),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Ver mais",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.mainColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
