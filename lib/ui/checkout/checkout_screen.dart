import 'package:flutter/material.dart';
import 'package:flutter_techtaste/model/dish.dart';
import 'package:flutter_techtaste/ui/_core/app_colors.dart';
import 'package:flutter_techtaste/ui/_core/bag_provider.dart';
import 'package:flutter_techtaste/ui/checkout/widgets/address_widget.dart';
import 'package:flutter_techtaste/ui/checkout/widgets/order_item_widget.dart';
import 'package:flutter_techtaste/ui/checkout/widgets/order_summary_widget.dart';
import 'package:flutter_techtaste/ui/checkout/widgets/payment_widget.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);
    Map<Dish, int> order = bagProvider.getMapByAmount();

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        title: Text("Sacola"),
        centerTitle: true,
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
          TextButton(
            onPressed: () {
              bagProvider.clearBag();
            },
            child: Text(
              "Limpar",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.mainColor,
              ),
            ),
          ),
          SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pedido",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.accentTextColor,
                ),
              ),
              SizedBox(height: 8),
              Column(
                spacing: 16,
                children: List.generate(order.keys.length, (index) {
                  Dish dish = order.keys.toList()[index];
                  int quantity = order[dish]!;
                  return OrderItemWidget(dish: dish, quantity: quantity);
                }),
              ),
              SizedBox(height: 24),
              Text(
                "Pagamento",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.accentTextColor,
                ),
              ),
              SizedBox(height: 8),
              PaymentWidget(),
              SizedBox(height: 24),
              Text(
                "Entregar no endereço",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.accentTextColor,
                ),
              ),
              SizedBox(height: 8),
              AddressWidget(),
              SizedBox(height: 24),
              Text(
                "Confirmar",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.accentTextColor,
                ),
              ),
              SizedBox(height: 8),
              OrderSummaryWidget(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
