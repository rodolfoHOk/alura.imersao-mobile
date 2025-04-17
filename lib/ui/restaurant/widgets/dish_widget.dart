import 'package:flutter/material.dart';
import 'package:flutter_techtaste/model/dish.dart';
import 'package:flutter_techtaste/routes/routes.dart';
import 'package:flutter_techtaste/ui/_core/app_colors.dart';

class DishWidget extends StatelessWidget {
  final String restaurantName;
  final Dish dish;
  const DishWidget({
    super.key,
    required this.restaurantName,
    required this.dish,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutes.dish,
            arguments: {'restaurantName': restaurantName, 'dish': dish},
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Ink(
          decoration: BoxDecoration(
            color: AppColors.lightBackgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset("assets/${dish.imagePath}"),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      dish.price.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.mainTextColor,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      dish.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.mainTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
