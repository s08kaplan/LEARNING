class User {
  final String id;
  final String username;
  final String email;
  final String password;
  final String? image;
  final bool isAdmin;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    this.image,
    required this.isAdmin,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      username: json["username"],
      email: json["email"],
      password: json["password"],
      image: json["image"] ?? "",
      isAdmin: json["isAdmin"],
    );
  }

   Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'image': image, 
    };
  }
}
