import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_1/model/cart_model.dart';

class CartService {
  final baseUrl = 'https://dummyjson.com/carts';

  Future<List<Cart>> getCarts () async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if(response.statusCode >= 200 && response.statusCode < 300){
        // print("response: ${response.body}");
        List<dynamic> jsonData = json.decode(response.body)["carts"];
        return jsonData.map((json) => Cart.fromJson(json)).toList();
      }
      else{
        throw Exception("error statusCode: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("failed to fetch carts : $error");
    }
  }

  Future<Cart> getSingleCart (int cartId) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/$cartId"));
      if(response.statusCode >= 200 && response.statusCode < 300){
         return Cart.fromJson(json.decode(response.body));
        
      }
      else{
        throw Exception("error statusCode: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("failed to fetch carts : $error");
    }
  }
}