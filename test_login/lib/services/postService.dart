import 'dart:convert';
import 'dart:io';

import 'package:test_login/models/post.dart';

import '../constants.dart';
import '../global.dart';
import '../models/pagination.dart';
import '../models/responseData.dart';
import 'package:http/http.dart' as http;

class PostService {
  PostService();

  Pagination<Post> paginationComment = Pagination(
      pageCount: 1,
      currentPage: 1,
      pageSize: 5,
      rowCount: 1,
      results: []
  );
  int currentPage = 1;

  Future<ResponseData<List<Post>>> getPost(int pageNumber) async{
    final dataRes = ResponseData<List<Post>>();
    try {
      final uri = Uri.parse('$urlBase/api/admin/post/paging?pageIndex=$pageNumber&pageSize=50');

      var response = await http.get(uri, headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${Global.user!.token}',
        HttpHeaders.contentTypeHeader: 'application/json',
      });

      if (response.statusCode == 200) {
        dataRes.statusCode = 200;
        Map<String, dynamic> json = jsonDecode(response.body);
        final data = Pagination<Post>.fromJson(json, Post.fromJsonModel);
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
}