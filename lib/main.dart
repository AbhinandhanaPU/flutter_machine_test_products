import 'package:flutter/material.dart';
import 'package:flutter_machine_test_products/view/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Machine test Products',
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}
