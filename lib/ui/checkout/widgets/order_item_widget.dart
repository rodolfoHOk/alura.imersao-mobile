import 'package:flutter/material.dart';
import 'package:flutter_techtaste/model/dish.dart';
import 'package:flutter_techtaste/ui/_core/app_colors.dart';
import 'package:flutter_techtaste/ui/_core/bag_provider.dart';
import 'package:provider/provider.dart';

class OrderItemWidget extends StatelessWidget {
  final Dish dish;
  final int quantity;

  const OrderItemWidget({
    super.key,
    required this.dish,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/dishes/default.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.horizontal(left: Radius.circular(16)),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(
                    dish.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.accentTextColor,
                    ),
                  ),
                  Text(
                    "R\$ ${dish.price.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.mainTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
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
                    bagProvider.addAllDishes([dish]);
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
              Text(
                quantity.toString(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.accentTextColor,
                ),
              ),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  shape: BoxShape.circle, // ou BoxShape.rectangle
                ),
                child: IconButton(
                  onPressed: () {
                    bagProvider.removeDish(dish);
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
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
