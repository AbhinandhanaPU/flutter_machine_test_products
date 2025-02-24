import 'package:flutter/material.dart';
import 'package:flutter_machine_test_products/controllers/login_controller.dart';
import 'package:flutter_machine_test_products/controllers/product_controller.dart';
import 'package:flutter_machine_test_products/controllers/single_product_controller.dart';
import 'package:flutter_machine_test_products/view/login_view.dart';
import 'package:flutter_machine_test_products/view/product_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginController()),
        ChangeNotifierProvider(create: (_) => ProductController()),
        ChangeNotifierProvider(create: (_) => SingleProductController()),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Flutter Machine test Products',
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (context) => LoginView(),
              '/productlist': (context) => ProductListView(),
            },
          );
        },
      ),
    );
  }
}
