import 'package:flutter/material.dart';
import 'package:flutter_techtaste/ui/_core/app_colors.dart';
import 'package:flutter_techtaste/ui/_core/bag_provider.dart';
import 'package:provider/provider.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);
    final int freight = 6;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 8,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Pedido:",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.mainTextColor,
                  ),
                ),
                Text(
                  "R\$ ${bagProvider.getItemsPrice().toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.accentTextColor,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Entrega:",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.mainTextColor,
                  ),
                ),
                Text(
                  "R\$ ${freight.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.accentTextColor,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total:",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.mainTextColor,
                  ),
                ),
                Text(
                  "R\$ ${(bagProvider.getItemsPrice() + freight).toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.accentTextColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                fixedSize: WidgetStatePropertyAll(Size(double.infinity, 48)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 8,
                children: [
                  Icon(Icons.account_balance_wallet_outlined, size: 24),
                  Text(
                    "Pedir",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
