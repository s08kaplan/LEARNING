
class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String warrantyInformation;
  final String shippingInformation;
  final String availibilityStatus;
  final List<Review> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final List<String> images;
  final String thumbnail;

Product({
  required this.id,
  required this.title,
  required this.description,
  required this.category,
  required this.price,
  required this.discountPercentage,
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
    title: json['title'],
    description: json['description'],
    category: json['category'],
    price: json['price'],
    discountPercentage: json['discountPercentage'],
    rating: json['rating'],
    stock: json['stock'],
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
   final int rating;
   final String comment;
   final String date;
   final String reviewerName;
   final String reviewerEmail;

   Review({
    required this.rating ,
    required this.comment ,
    required this.date ,
    required this.reviewerName ,
    required this.reviewerEmail ,
   });

   factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      rating: json['rating'],
      comment: json['comment'],
      date: json['date'],
      reviewerName: json['reviewerName'],
      reviewerEmail: json['reviewerEmail'],
     );
   }
}