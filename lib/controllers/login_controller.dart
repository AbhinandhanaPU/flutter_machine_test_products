// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginController with ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    final url = Uri.parse('https://dummyjson.com/auth/login');
    final body = jsonEncode({
      "username": username,
      "password": password,
    });
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        log("Login Success: ${data.toString()}");
        // Navigate to Product List Page
        Navigator.pushReplacementNamed(context, '/productlist',
            arguments: data);
      } else {
        log("Error: ${data['message']}");
        _showSnackbar(context, data['message'] ?? "Login failed!");
      }
    } catch (e) {
      log('Something went wrong!');
      _showSnackbar(context, "Something went wrong!");
    }

    _isLoading = false;
    notifyListeners();
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
