import 'package:flutter/material.dart';
import 'package:project_1/api/api_service.dart';
import 'package:project_1/model/product_model.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    products = ApiService().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PyScript Store Products")),
      body: FutureBuilder<List<Product>>(
          future: products,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              final products = snapshot.data!;
              return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Card(
                          elevation: 2,
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.title,
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold)),
                                  Text(product.description,
                                      style: const TextStyle(fontSize: 16)),
                                  Text("Category: ${product.category}"),
                                  Text("Price: \$${product.price}"),
                                  Text(
                                      "Discount: ${product.discountPercentage}%"),
                                  Text("Rating: ${product.rating}"),
                                  Text("Stock: ${product.stock}"),
                                ],
                              )));
                    },
                  ));
            } else {
              return const Center(child: Text("No data found"));
            }
          }),
    );
  }
}
