import 'dart:convert';
import 'dart:io';

import 'package:test_login/models/user.dart';
import 'package:test_login/models/user_response.dart';

import '../constants.dart';
import '../global.dart';
import '../models/UserRequest.dart';
import '../models/responseData.dart';
import 'package:http/http.dart' as http;

class UserService {
  UserService();

  Future<ResponseData<User>> getMember(String userId) async{
    final dataRes = ResponseData<User>();
    try {
      final uri = Uri.parse('$urlBase/api/admin/user/$userId');

      var response = await http.get(uri, headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${Global.user!.token}',
        HttpHeaders.contentTypeHeader: 'application/json',
      });

      if (response.statusCode == 200) {
        dataRes.statusCode = 200;
        final member = User.fromJson(jsonDecode(response.body));
        dataRes.data = member;
      } else {
        dataRes.message = '${response.statusCode} ${response.body}';
      }
    } catch (e) {
      dataRes.message = e.toString();
    }
    return dataRes;
  }

  Future<ResponseData<User>> updateMember(UserRequest user) async{
    final dataRes = ResponseData<User>();
    try{
      final uri = Uri.parse('$urlBase/api/admin/user/${user.id}');
      Map<String, dynamic> param = <String, dynamic>{};
      param["firstName"] = user.firstName.toString();
      param["lastName"] = user.lastName.toString();
      param["phoneNumber"] = user.phoneNumber.toString();
      param["isActive"] = true;

      var response = await http.put(uri, headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${Global.user!.token}',
        HttpHeaders.contentTypeHeader: 'application/json',
      },
          body: jsonEncode(param)
      );

      if (response.statusCode == 200) {
        //final user = UserResponse(id: id, token: token, refreshToken: refreshToken).fromJson(jsonDecode(response.body));
        dataRes.statusCode = 200;
        //resp.user = user;
      } else {
        //resp.error = '${response.statusCode} ${response.body}';
        //return resp;
      }

    }catch(e){

    }
    return dataRes;
  }

}