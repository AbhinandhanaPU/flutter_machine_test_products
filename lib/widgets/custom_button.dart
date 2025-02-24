import 'package:flutter/material.dart';
import 'package:flutter_machine_test_products/utils/colors.dart';

class CustomcoloredButton extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  const CustomcoloredButton({
    super.key,
    required this.text,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
