import 'package:flutter/material.dart';
import 'package:flutter_techtaste/data/categories_data.dart';
import 'package:flutter_techtaste/data/restaurants_data.dart';
import 'package:flutter_techtaste/model/restaurant.dart';
import 'package:flutter_techtaste/ui/_core/app_colors.dart';
import 'package:flutter_techtaste/ui/_core/widgets/appbar.dart';
import 'package:flutter_techtaste/ui/home/widgets/category_widget.dart';
import 'package:flutter_techtaste/ui/home/widgets/restaurant_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "";

  void handleSelectCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    RestaurantsData restaurantsData = Provider.of<RestaurantsData>(context);
    List<Restaurant> filteredRestaurants =
        selectedCategory != ""
            ? restaurantsData.listRestaurant
                .where(
                  (restaurant) =>
                      restaurant.categories.contains(selectedCategory),
                )
                .toList()
            : restaurantsData.listRestaurant;

    return Scaffold(
      appBar: getAppBar(context: context),
      drawer: Drawer(child: Center(child: Text("Conteúdo do drawer"))),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 24,
            children: [
              Center(child: Image.asset("assets/logo.png", width: 147)),
              Text(
                "Boas-vindas!",
                style: TextStyle(
                  fontSize: 22,
                  color: AppColors.accentTextColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.mainTextColor,
                      width: 1.1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.mainTextColor,
                      width: 1.1,
                    ),
                  ),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                  labelText: "O que você quer comer?",
                  labelStyle: TextStyle(color: AppColors.mainTextColor),
                ),
              ),
              Text(
                "Escolha por categoria",
                style: TextStyle(
                  fontSize: 22,
                  color: AppColors.accentTextColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 16,
                  children: List.generate(
                    CategoriesData.listCategories.length,
                    (index) {
                      String category = CategoriesData.listCategories[index];
                      return CategoryWidget(
                        category: category,
                        isSelected: selectedCategory == category,
                        onTapCategory: handleSelectCategory,
                      );
                    },
                  ),
                ),
              ),
              Image.asset("assets/banners/banner_promo.png"),
              Text(
                "Bem avaliados",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.accentTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Column(
                spacing: 8,
                children: List.generate(filteredRestaurants.length, (index) {
                  Restaurant restaurant = filteredRestaurants[index];
                  return RestaurantWidget(restaurant: restaurant);
                }),
              ),
              SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }
}
