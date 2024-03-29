import 'package:flutter/material.dart';

import '../../../../config/custom_colors.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile(
      {Key? key,
      required this.category,
      required this.isSelected,
      required this.onPressed})
      : super(key: key);

  final String category;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onPressed,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected
                ? CustomColors.customSwatchColor
                : Colors.transparent,
          ),
          child: Text(category,
              style: TextStyle(
                  fontSize: isSelected ? 16 : 14,
                  color: isSelected
                      ? Colors.white
                      : CustomColors.customContrastColor,
                  fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
