import 'package:flutter/material.dart';
import 'package:flutter_techtaste/ui/_core/app_colors.dart';

class MenuButton extends StatelessWidget {
  final String label;
  final bool? isDisable;
  final Function() onButtonTap;

  const MenuButton({
    super.key,
    required this.label,
    this.isDisable,
    required this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:
          isDisable == true
              ? null
              : () {
                onButtonTap();
              },
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(AppColors.backgroundColor),
        backgroundColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return AppColors.disabledButtonColor;
          } else if (states.contains(WidgetState.pressed)) {
            return AppColors.pressedButtonColor;
          }
          return AppColors.mainColor;
        }),
        fixedSize: WidgetStatePropertyAll(Size(double.infinity, 56)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 14, color: AppColors.backgroundColor),
          ),
        ],
      ),
    );
  }
}
