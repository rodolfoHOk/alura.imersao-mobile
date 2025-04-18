import 'package:flutter/material.dart';
import 'package:flutter_techtaste/model/restaurant.dart';
import 'package:flutter_techtaste/routes/routes.dart';
import 'package:flutter_techtaste/ui/_core/app_colors.dart';

class RestaurantWidget extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.restaurant,
          arguments: restaurant,
        );
      },
      borderRadius: BorderRadius.circular(8),
      child: Row(
        spacing: 16,
        children: [
          ClipOval(
            child: Image.asset('assets/${restaurant.imagePath}', width: 96),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Text(
                restaurant.name,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.accentTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: List.generate(restaurant.stars.toInt(), (index) {
                  return Image.asset('assets/others/star.png', width: 16);
                }),
              ),
              Text(
                "${restaurant.distance}km",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.mainTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
