import 'package:flutter/material.dart';
import 'package:flutter_techtaste/model/dish.dart';
import 'package:flutter_techtaste/model/restaurant.dart';
import 'package:flutter_techtaste/ui/_core/app_colors.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        title: Text(restaurant.name),
        leading: Row(
          children: [
            SizedBox(width: 8),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
              iconSize: 28,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
            iconSize: 28,
          ),
          SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Center(
              child: Image.asset('assets/${restaurant.imagePath}', width: 160),
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
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: restaurant.dishes.length,
                      itemBuilder: (context, index) {
                        final Dish dish = restaurant.dishes[index];
                        return Material(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.lightBackgroundColor,
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.asset("assets/dishes/default.png"),
                            ),
                            title: Text(
                              dish.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.accentTextColor,
                              ),
                            ),
                            subtitle: Text(
                              "R\$ ${dish.price.toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.mainTextColor,
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.add),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(height: 16),
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
