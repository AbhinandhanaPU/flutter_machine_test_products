import 'package:flutter/material.dart';
import 'package:flutter_machine_test_products/utils/colors.dart';

class CustomTextfieldWithLabel extends StatelessWidget {
  final String text;
  final String hintText;
  final String? helperText;
  final Icon prefixIcon;
  final Icon? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool obscureText;

  const CustomTextfieldWithLabel({
    super.key,
    required this.text,
    required this.hintText,
    this.helperText,
    required this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.maxLines = 1,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          maxLines: maxLines,
          obscureText: obscureText,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            helperText: helperText,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.lightPrimary,
                width: 2,
              ),
            ),
          ),
        )
      ],
    );
  }
}
