import 'package:flutter/material.dart';
import 'package:flutter_techtaste/model/dish.dart';
import 'package:flutter_techtaste/model/restaurant.dart';
import 'package:flutter_techtaste/routes/routes.dart';
import 'package:flutter_techtaste/ui/_core/bag_provider.dart';
import 'package:flutter_techtaste/data/restaurants_data.dart';
import 'package:flutter_techtaste/ui/_core/app_theme.dart';
import 'package:flutter_techtaste/ui/checkout/checkout_screen.dart';
import 'package:flutter_techtaste/ui/dish/dish_screen.dart';
import 'package:flutter_techtaste/ui/home/home_screen.dart';
import 'package:flutter_techtaste/ui/restaurant/restaurant_screen.dart';
import 'package:flutter_techtaste/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RestaurantsData restaurantsData = RestaurantsData();
  await restaurantsData.getRestaurants();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => restaurantsData),
        ChangeNotifierProvider(create: (context) => BagProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.splash:
            return MaterialPageRoute(builder: (context) => SplashScreen());

          case AppRoutes.home:
            return MaterialPageRoute(builder: (context) => HomeScreen());

          case AppRoutes.restaurant:
            final restaurant = settings.arguments as Restaurant;
            return MaterialPageRoute(
              builder: (context) => RestaurantScreen(restaurant: restaurant),
            );

          case AppRoutes.dish:
            final arguments = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder:
                  (context) => DishScreen(
                    restaurantName: arguments['restaurantName'],
                    dish: arguments['dish'] as Dish,
                  ),
            );

          case AppRoutes.checkout:
            return MaterialPageRoute(builder: (context) => CheckoutScreen());

          default:
            return MaterialPageRoute(
              builder:
                  (context) => Scaffold(
                    body: Center(child: Text('Tela não encontrada')),
                  ),
            );
        }
      },
    );
  }
}
