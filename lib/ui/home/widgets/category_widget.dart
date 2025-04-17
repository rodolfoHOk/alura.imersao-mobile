import 'package:flutter/material.dart';
import 'package:flutter_techtaste/ui/_core/app_colors.dart';

class CategoryWidget extends StatelessWidget {
  final String category;
  final bool isSelected;
  final Function(String) onTapCategory;

  const CategoryWidget({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTapCategory,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => isSelected ? onTapCategory("") : onTapCategory(category),
      borderRadius: BorderRadius.circular(8),
      child: Ink(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color:
              isSelected
                  ? AppColors.pressedButtonColor
                  : AppColors.lightBackgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [
            Image.asset(
              'assets/categories/${category.toLowerCase()}.png',
              height: 48,
            ),
            Text(
              category,
              style: TextStyle(fontSize: 16, color: AppColors.accentTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
