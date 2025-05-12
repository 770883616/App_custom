import 'dart:convert';
import 'package:explore_pc/models/computer.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://192.168.0.29:8000/api";

  Future<List<Computer>> getProducts({String? category}) async {
    final url = category != null
        ? Uri.parse('$baseUrl/products?category=$category')
        : Uri.parse('$baseUrl/products');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // تحقق إذا كانت الاستجابة تحتوي على data أو message
      if (data is Map && data.containsKey('data')) {
        final List<dynamic> productsJson = data['data'];
        return productsJson.map((json) => Computer.fromJson(json)).toList();
      } else if (data is Map && data.containsKey('message')) {
        return []; // لا توجد منتجات
      } else {
        throw Exception('Invalid response format');
      }
    } else {
      throw Exception('Failed to load products');
    }
  }
}
