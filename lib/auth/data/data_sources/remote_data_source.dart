// lib/auth/data/data_sources/remote_data_source.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class RemoteDataSource {
  final String apiUrl = "https://your-api.com/auth"; // Replace with your actual API

  Future<UserModel> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/login'),
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return UserModel.fromJson(data);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<UserModel> register(String username, String email, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/register'),
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return UserModel.fromJson(data);
    } else {
      throw Exception('Failed to register');
    }
  }
}
