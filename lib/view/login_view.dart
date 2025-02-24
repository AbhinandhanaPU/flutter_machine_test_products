import 'package:flutter/material.dart';
import 'package:flutter_machine_test_products/utils/colors.dart';
import 'package:flutter_machine_test_products/widgets/custom_button.dart';
import 'package:flutter_machine_test_products/widgets/custom_textfield_with_label.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 10,
                children: [
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/login.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Text(
                    "LOGIN",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkPrimary),
                  ),
                  const Text(
                    "Welcome back! Please login to your account.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextfieldWithLabel(
                    text: 'Username',
                    hintText: 'Account Username',
                    prefixIcon: Icon(Icons.person),
                    controller: TextEditingController(),
                    validator: (fieldContent) {
                      if (fieldContent == null || fieldContent.isEmpty) {
                        return "Field is mandatory";
                      }
                      return null;
                    },
                  ),
                  CustomTextfieldWithLabel(
                    text: 'Password',
                    hintText: 'Account Password',
                    prefixIcon: Icon(Icons.password),
                    controller: TextEditingController(),
                    validator: (fieldContent) {
                      if (fieldContent == null || fieldContent.isEmpty) {
                        return "Field is mandatory";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {}
                    },
                    child: CustomcoloredButton(
                      text: 'LOGIN',
                      height: 60,
                      width: double.infinity,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
