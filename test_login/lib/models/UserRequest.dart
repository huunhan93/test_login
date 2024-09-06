import 'dart:ffi';

class UserRequest {
  String id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  bool isActive;

  UserRequest({
    required this.id,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    required this.isActive});

  factory UserRequest.fromJson(Map<String, dynamic> json) {
    return UserRequest(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'isActive': isActive,
      };

}