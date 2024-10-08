import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_1/model/product_model.dart';

class ApiService {
  final String apiUrl = "https://dummyjson.com/products";

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode >= 200 && response.statusCode < 300) {
      List<dynamic> jsonData = json.decode(response.body)['products'];
      return jsonData.map((json) => Product.fromJson(json)).toList();
    }else {
      throw Exception("Failed to get products: ${response.statusCode}");
    }
  }

  Future<Product> fetchProduct(int productId) async {
    final response = await http.get(Uri.parse("$apiUrl/$productId"));

    if(response.statusCode >= 200 && response.statusCode < 300) {
      return Product.fromJson(json.decode(response.body));
    }else {
      throw Exception("Failed to get product: ${response.statusCode}");
    }
  }
}