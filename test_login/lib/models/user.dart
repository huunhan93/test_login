import 'dart:ffi';

class User {
  String id;
  String username;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? imageUrl;
  String? token;
  bool? isActive;

  User({
    required this.id,
    required this.username,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.imageUrl,
    this.token,
    this.isActive});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['userName'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      imageUrl: json['imageUrl'],
      token: json['token'],
      isActive: json['isActive']
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'userName': username,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'imageUrl': imageUrl,
        'token': token,
        'isActive': isActive
      };
}