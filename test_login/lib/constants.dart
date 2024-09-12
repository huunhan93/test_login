import 'dart:ui';

import 'package:flutter/material.dart';

import 'size_config.dart';

const serverName = "10.93.39.73"; //10.0.2.2 for mobile or localhost for desktop app
const urlBase = "http://$serverName:8084";

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF736570);
const kTextColor = Colors.black;

const kAnimationDuration = Duration(milliseconds: 200);

const headingStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Bạn chưa nhập tài khoản";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Bạn chưa nhập mật khẩu";
const String kShortPassError = "Mật khẩu quá ngắn";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Bạn chưa nhập tên";
const String kPhoneNumberNullError = "Bạn chưa nhập số điện thoại";
const String kAddressNullError = "Bạn chưa nhập email";

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 16),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: kTextColor),
  );
}

const double defaultPadding = 16.0;