// lib/services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../const.dart';

class ApiService {
  static Future<List<dynamic>> fetchRecipes() async {
    final response = await http.get(
      Uri.parse('$baseUrl/recipes/complexSearch?apiKey=$apiKey&number=10'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['results'];
    } else {
      throw Exception('Failed to load recipes');
    }
  }

  static Future<Map<String, dynamic>> fetchRecipeDetails(int id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/recipes/$id/information?apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load recipe details');
    }
  }
}
