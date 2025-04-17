import 'package:flutter/material.dart';
import 'package:flutter_techtaste/model/dish.dart';
import 'package:flutter_techtaste/ui/_core/app_colors.dart';
import 'package:flutter_techtaste/ui/_core/bag_provider.dart';
import 'package:flutter_techtaste/ui/_core/widgets/appbar.dart';
import 'package:provider/provider.dart';

class DishScreen extends StatefulWidget {
  final String restaurantName;
  final Dish dish;
  const DishScreen({
    super.key,
    required this.restaurantName,
    required this.dish,
  });

  @override
  State<DishScreen> createState() => _DishScreenState();
}

class _DishScreenState extends State<DishScreen> {
  List<Dish> dishes = [];

  void incrementQuantity() {
    setState(() {
      dishes.add(widget.dish);
    });
  }

  void decrementQuantity() {
    setState(() {
      dishes.remove(widget.dish);
    });
  }

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);

    return Scaffold(
      appBar: getAppBar(context: context, title: widget.restaurantName),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 24,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Image.asset("assets/dishes/default.png"),
                Text(
                  widget.dish.name,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.accentTextColor,
                  ),
                ),
                Text(
                  widget.dish.price.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: AppColors.mainTextColor,
                  ),
                ),
                Text(
                  widget.dish.description,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.mainTextColor,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    shape: BoxShape.circle, // ou BoxShape.rectangle
                  ),
                  child: IconButton(
                    onPressed: () {
                      incrementQuantity();
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateColor.resolveWith((states) {
                        if (states.contains(WidgetState.disabled)) {
                          return AppColors.disabledButtonColor;
                        } else if (states.contains(WidgetState.pressed)) {
                          return AppColors.pressedButtonColor;
                        }
                        return AppColors.mainColor;
                      }),
                    ),
                    iconSize: 24,
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.arrow_drop_up,
                      color: AppColors.backgroundColor,
                    ),
                  ),
                ),
                Text(dishes.length.toString()),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    shape: BoxShape.circle, // ou BoxShape.rectangle
                  ),
                  child: IconButton(
                    onPressed: () {
                      decrementQuantity();
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateColor.resolveWith((states) {
                        if (states.contains(WidgetState.disabled)) {
                          return AppColors.disabledButtonColor;
                        } else if (states.contains(WidgetState.pressed)) {
                          return AppColors.pressedButtonColor;
                        }
                        return AppColors.mainColor;
                      }),
                    ),
                    iconSize: 24,
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: AppColors.backgroundColor,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                bagProvider.addAllDishes(dishes);
              },
              style: ButtonStyle(
                fixedSize: WidgetStateProperty.all(Size(double.infinity, 48)),
              ),
              child: Text(
                "Adicionar",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
