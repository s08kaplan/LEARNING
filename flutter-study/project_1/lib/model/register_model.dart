
class RegisterModel {
  final String username;
  final String email;
  final String password;
  final String? image;

  RegisterModel({
    required this.username,
    required this.email,
    required this.password,
    this.image,
  });

Map<String, dynamic> toJson() {
  return {
   'username': username,
      'email': email,
      'password': password,
      'image': image, 
  };
}
}