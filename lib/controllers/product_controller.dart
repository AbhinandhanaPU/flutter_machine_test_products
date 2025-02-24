import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_machine_test_products/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductController with ChangeNotifier {
  List<ProductModel> _products = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<ProductModel> get products => _products;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchAllProducts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final url = Uri.parse('https://dummyjson.com/products');

    try {
      final response = await http.get(url);
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _products = (data['products'] as List)
            .map((product) => ProductModel.fromJson(product))
            .toList();
        log("Fetched ${_products.length} products");
      } else {
        _errorMessage = data['message'] ?? "Failed to fetch products!";
        log(data['message']);
      }
    } catch (e) {
      _errorMessage = "Something went wrong!";
      log("Error fetching products: $e");
    }

    _isLoading = false;
    notifyListeners();
  }
}
