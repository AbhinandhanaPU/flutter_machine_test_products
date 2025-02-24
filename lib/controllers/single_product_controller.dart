import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_machine_test_products/model/product_model.dart';
import 'package:http/http.dart' as http;

class SingleProductController extends ChangeNotifier {
  ProductModel? product;
  bool isLoading = false;

  Future<void> fetchProduct(int productId) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse('https://dummyjson.com/products/$productId');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        product = ProductModel.fromJson(data);
      } else {
        log('Failed to load product');
        throw Exception('Failed to load product');
      }
    } catch (e) {
      log('Error fetching product: $e');
    }

    isLoading = false;
    notifyListeners();
  }
}
