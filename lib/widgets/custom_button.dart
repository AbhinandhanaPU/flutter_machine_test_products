import 'package:flutter/material.dart';
import 'package:flutter_machine_test_products/utils/colors.dart';

class CustomcoloredButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final void Function()? onTap;
  const CustomcoloredButton({
    super.key,
    required this.text,
    required this.height,
    required this.width,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.lightPrimary,
              AppColors.darkPrimary,
            ],
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
