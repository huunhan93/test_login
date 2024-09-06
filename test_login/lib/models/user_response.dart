


import 'user.dart';

class UserResponse {
  User? user;
  String? error;
  String? id;
  String? token;
  String? refreshToken;

  UserResponse({
    required this.id,
    required this.token,
    required this.refreshToken});

  UserResponse.mock(this.user): error = "";

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['id'],
      token: json['token'],
      refreshToken: json['refreshToken'],
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'token': token,
        'refreshToken': refreshToken,
      };
}

