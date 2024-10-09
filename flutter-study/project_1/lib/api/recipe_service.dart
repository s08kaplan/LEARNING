import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_1/model/recipe_model.dart';

class RecipeApi{
   final baseUrl = 'https://dummyjson.com/recipes';

   Future<List<Recipe>> getRecipes() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode >= 200 && response.statusCode < 300) {
      List<dynamic> jsonData = json.decode(response.body)['recipes'];
      return jsonData.map((json) => Recipe.fromJson(json)).toList();
    }else {
      throw Exception("Failed to get products: ${response.statusCode}");
    }
    } catch (error) {
      throw Exception("Failed to get recipes: $error");
    }
   }

   Future<Recipe> getSingleRecipe(int recipeId) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/$recipeId"));
      if (response.statusCode >= 200 && response.statusCode < 300) {
       return Recipe.fromJson(json.decode(response.body));
      
    }else {
      throw Exception("Failed to get products: ${response.statusCode}");
    }
    } catch (error) {
      throw Exception("Failed to get recipes: $error");
    }
   }


}