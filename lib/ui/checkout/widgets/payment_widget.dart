import 'package:flutter/material.dart';
import 'package:flutter_techtaste/ui/_core/app_colors.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SizedBox(width: 20),
          Image.asset("assets/others/visa.png", width: 30, height: 16),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "VISA Classic",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.mainTextColor,
                    ),
                  ),
                  Text(
                    "**** **** **** 0976",
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
              IconButton(
                onPressed: () {},
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
                  Icons.chevron_right,
                  color: AppColors.backgroundColor,
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
