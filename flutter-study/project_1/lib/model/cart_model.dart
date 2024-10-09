// class Cart {
//   int id;
//   List<Product> products;
//   double? total;
//   double? discountedTotal;
//   int userId;
//   int totalProducts;
//   int totalQuantity;

//   Cart({
//     required this.id,
//     required this.products,
//     this.total,
//     this.discountedTotal,
//     required this.userId,
//     required this.totalProducts,
//     required this.totalQuantity,
//   });

//   factory Cart.fromJson(Map<String, dynamic> json) {
//     return Cart(
//       id: json["id"],
//       products: (json["products"] as List)
//           .map((product) => Product.fromJson(product))
//           .toList(),
//       total: (json["total"] ?? 0).toDouble(),  // Handle null
//       discountedTotal: (json["discountedTotal"] ?? 0).toDouble(),  // Handle null
//       userId: json["userId"],
//       totalProducts: json["totalProducts"] ?? 0,  // Handle null
//       totalQuantity: json["totalQuantity"] ?? 0,  // Handle null
//     );
//   }
// }

// class Product {
//   int id;
//   String title;
//   double price;
//   int quantity;
//   double total;
//   double discountPercentage;
//   double discountTotal;
//   String thumbnail;

//   Product({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.quantity,
//     required this.total,
//     required this.discountPercentage,
//     required this.discountTotal,
//     required this.thumbnail,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json["id"],
//       title: json["title"],
//       price: json["price"],
//       quantity: json["quantity"],
//       total: json["total"],
//       discountPercentage: json["discountPercentage"],
//       discountTotal: json["discountTotal"],
//       thumbnail: json["thumbnail"],
//     );
//   }
// }
class Cart {
  int? id;
  List<Products>? products;
  double? total;
  double? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;

  Cart(
      {this.id,
      this.products,
      this.total,
      this.discountedTotal,
      this.userId,
      this.totalProducts,
      this.totalQuantity});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    total = json['total'];
    discountedTotal = json['discountedTotal'];
    userId = json['userId'];
    totalProducts = json['totalProducts'];
    totalQuantity = json['totalQuantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['discountedTotal'] = this.discountedTotal;
    data['userId'] = this.userId;
    data['totalProducts'] = this.totalProducts;
    data['totalQuantity'] = this.totalQuantity;
    return data;
  }
}

class Products {
  int? id;
  String? title;
  double? price;
  int? quantity;
  double? total;
  double? discountPercentage;
  double? discountedTotal;
  String? thumbnail;

  Products(
      {this.id,
      this.title,
      this.price,
      this.quantity,
      this.total,
      this.discountPercentage,
      this.discountedTotal,
      this.thumbnail});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    quantity = json['quantity'];
    total = json['total'];
    discountPercentage = json['discountPercentage'];
    discountedTotal = json['discountedTotal'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['total'] = this.total;
    data['discountPercentage'] = this.discountPercentage;
    data['discountedTotal'] = this.discountedTotal;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}