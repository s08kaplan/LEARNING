// import 'package:flutter/material.dart';
// import 'package:project_1/api/cart_service.dart';
// import 'package:project_1/model/cart_model.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   late Future<List<Cart>> carts;

//   @override
//   void initState() {
//     super.initState();
//     carts = CartService().getCarts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text("Carts")),
//         body: FutureBuilder<List<Cart>>(
//             future: carts,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (snapshot.hasError) {
//                 return Center(child: Text("Error: ${snapshot.error}"));
//               } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
//                 // print("snapshot: ${snapshot.data}");
//                 return Padding(
//                     padding: EdgeInsets.all(16.0),
//                     child: ListView.builder(
//                         itemCount: snapshot.data!.length,
//                         itemBuilder: (context, index) {
//                           final cart = snapshot.data![index];
//                           return Card(
//                             child: Column(
//                               children: [
//                                 Text("${cart.totalProducts}"),
//                                 ListView.builder(
//                                     itemCount: cart.products.length,
//                                     itemBuilder: (context, productIndex) {
//                                       final product =
//                                           cart.products[productIndex];
//                                       return ListTile(
//                                           title: Text("${product.title}"));
//                                     })
//                               ],
//                             ),
//                           );
//                         }));
//               } else {
//                 return const Center(child: Text('No carts available'));
//               }
//             }));
//   }
// }

import 'package:flutter/material.dart';
import 'package:project_1/api/cart_service.dart';
import 'package:project_1/model/cart_model.dart';
import 'package:project_1/screens/cart_detail.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late Future<List<Cart>> carts;

  @override
  void initState() {
    super.initState();
    carts = CartService().getCarts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Carts")),
      body: FutureBuilder<List<Cart>>(
        future: carts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final cart = snapshot.data![index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total Products: ${cart.totalProducts ?? 0}"),
                          SizedBox(height: 8), // Add some spacing
                          if (cart.products != null &&
                              cart.products!.isNotEmpty)
                            Column(
                              children: cart.products!.map((product) {
                                return ListTile(
                                  leading: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => CartDetail(
                                                  product: product),
                                                  ),
                                                  );
                                    },
                                  
                                  child: product.thumbnail != null
                                      ? Image.network(
                                          product.thumbnail!,
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Icon(Icons.error);
                                          },
                                        )
                                      : Icon(Icons.image),
                                  ),
                                  title: Text("${product.title}"),
                                  subtitle: Text("Price: ${product.price}"),
                                );
                              }).toList(),
                            )
                          else
                            const Text('No products available'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(child: Text('No carts available'));
          }
        },
      ),
    );
  }
}
