

import 'dart:convert';

import '../constants.dart';
import '../models/user.dart';
import '../models/user_response.dart';
import 'package:http/http.dart' as http;

class AuthASP{
  AuthASP();

  Future<UserResponse> signIn(String userName, String password) async {
    UserResponse resp = UserResponse(id: "", token: "", refreshToken: "");
    Map<String, String> param = <String, String>{};
    param["UserName"] = userName;
    param["Password"] = password;

    try {
      final url = Uri.parse('$urlBase/api/admin/auth');
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(param));

      if (response.statusCode == 200) {
        final user = UserResponse.fromJson(jsonDecode(response.body));
        resp.error = '200';
        var tempUser = User(id: user.id.toString(),username: userName);
        tempUser.token = user.token.toString();
        resp.user = tempUser;
      } else {
        resp.error = '${response.statusCode} ${response.body}';
        return resp;
      }
    } catch (e) {
      print(e);
      resp.error = e.toString();
    }
    return resp;
  }
}