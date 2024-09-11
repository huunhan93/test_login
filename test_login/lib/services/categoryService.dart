import 'dart:convert';
import 'dart:io';


import '../constants.dart';
import '../global.dart';
import '../models/category.dart';
import '../models/pagination.dart';
import '../models/responseData.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  CategoryService();

  Pagination<Category> paginationComment = Pagination(
      pageCount: 1,
      currentPage: 1,
      pageSize: 5,
      rowCount: 1,
      results: []
  );
  int currentPage = 1;

  Future<ResponseData<List<Category>>> getCategory() async{
    final dataRes = ResponseData<List<Category>>();
    try {
      final uri = Uri.parse('$urlBase/api/admin/post-category/paging?pageIndex=$currentPage&pageSize=50');

      var response = await http.get(uri, headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${Global.user!.token}',
        HttpHeaders.contentTypeHeader: 'application/json',
      });

      if (response.statusCode == 200) {
        dataRes.statusCode = 200;
        Map<String, dynamic> json = jsonDecode(response.body);
        final data = Pagination<Category>.fromJson(json, Category.fromJsonModel);
        paginationComment = data;
        dataRes.data = data.results;
      } else {
        dataRes.message = '${response.statusCode} ${response.body}';
      }
    } catch (e) {
      dataRes.message = e.toString();
    }
    return dataRes;
  }

  Future<bool> deleteCategory(String id) async{
    try {
      final uri = Uri.parse('$urlBase/api/admin/post-category?ids=$id');

      var response = await http.delete(uri, headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${Global.user!.token}',
        HttpHeaders.contentTypeHeader: 'application/json',
      });

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<ResponseData<Category>> getCategoryById(String id) async{
    final dataRes = ResponseData<Category>();
    try {
      final uri = Uri.parse('$urlBase/api/admin/post-category/$id');

      var response = await http.get(uri, headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${Global.user!.token}',
        HttpHeaders.contentTypeHeader: 'application/json',
      });

      if (response.statusCode == 200) {
        dataRes.statusCode = 200;
        //Map<String, dynamic> json = jsonDecode(response.body);
        final category = Category.fromJson(jsonDecode(response.body));
        dataRes.data = category;
      } else {
        dataRes.message = '${response.statusCode} ${response.body}';
      }
    } catch (e) {
      dataRes.message = e.toString();
    }
    return dataRes;
  }

  Future<ResponseData<Category>> updateCategory(Category category) async{
    final dataRes = ResponseData<Category>();
    try{
      final uri = Uri.parse('$urlBase/api/admin/post-category?id=${category.id}');
      Map<String, dynamic> param = <String, dynamic>{};
      param["name"] = category.name.toString();
      param["slug"] = category.name.toString();
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

  Future<ResponseData<Category>> addCategory(Category category) async{
    final dataRes = ResponseData<Category>();
    try{
      final uri = Uri.parse('$urlBase/api/admin/post-category');
      Map<String, dynamic> param = <String, dynamic>{};
      param["name"] = category.name.toString();
      param["slug"] = category.name.toString();
      param["isActive"] = true;

      var response = await http.post(uri, headers: {
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