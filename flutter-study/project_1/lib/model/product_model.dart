
class Product {
 int id;
 String title;
 String description;
 String? category;
 double price;
 double? discountPercentage;
 double rating;
 int stock;
 String brand;
 String warrantyInformation;
 String shippingInformation;
 String availibilityStatus;
 List<Review> reviews;
 String returnPolicy;
 int minimumOrderQuantity;
 List<String> images;
 String thumbnail;

Product({
  required this.id,
  required this.title,
  required this.description,
   this.category,
  required this.price,
   this.discountPercentage,
  required this.rating,
  required this.stock,
  required this.brand,
  required this.warrantyInformation,
  required this.shippingInformation,
  required this.availibilityStatus,
  required this.reviews,
  required this.returnPolicy,
  required this.minimumOrderQuantity,
  required this.images,
  required this.thumbnail,
});

factory Product.fromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'],
    title: json['title'] ?? "",
    description: json['description'] ?? "",
    category: json['category'],
    price: (json['price'] ?? 0.0).toDouble(),
    discountPercentage: (json['discountPercentage'] as double?)?.toDouble(),
    rating: json['rating'],
    stock: json['stock'] ?? 0,
    brand: json['brand'],
    warrantyInformation: json['warrantyInformation'],
    shippingInformation: json['shippingInformation'],
    availibilityStatus: json['availibilityStatus'],
    reviews: json['reviews'],
    returnPolicy: json['returnPolicy'],
    minimumOrderQuantity: json['minimumOrderQuantity'],
    images: json['images'],
    thumbnail: json['thumbnail'],
  );
}

}




class Review  {
    int rating;
    String comment;
    DateTime? date;
    String reviewerName;
    String reviewerEmail;

   Review({
    required this.rating ,
    required this.comment ,
    this.date ,
    required this.reviewerName ,
    required this.reviewerEmail ,
   });

   factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating'],
      comment: json['comment'],
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      reviewerName: json['reviewerName'],
      reviewerEmail: json['reviewerEmail'],
     );
   }
}



