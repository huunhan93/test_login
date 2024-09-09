import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:test_login/screens/home/components/post_item.dart';
import 'package:http/http.dart' as http;
import 'package:test_login/services/postService.dart';

import '../../../components/product_card.dart';
import '../../../constants.dart';
import '../../../global.dart';
import '../../../models/Product.dart';
import '../../../models/pagination.dart';
import '../../../models/post.dart';
import '../../profile/components/profile_menu.dart';
import '../../profile/components/profile_pic.dart';
import 'section_title.dart';

class Posts extends StatefulWidget{
  const Posts({super.key});
  @override
  State<StatefulWidget> createState() {
    return PostsState();
  }

}

class PostsState extends State<Posts>{
  late PageController _pageController;
  final pageSize = 5;
  final PagingController<int, Post> _pagingController = PagingController(firstPageKey: 0);

  Pagination<Post> paginationPost = Pagination(
      pageCount: 1,
      currentPage: 1,
      pageSize: 5,
      rowCount: 1,
      results: []
  );

  @override
  void initState() {
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  // Future<void> fetchPosts(int pageNumber) async {
  //   try {
  //     final uri = Uri.parse('$urlBase/api/admin/post/paging?pageIndex=$pageNumber&pageSize=$pageSize');
  //     var response = await http.get(uri, headers: {
  //       HttpHeaders.authorizationHeader: 'Bearer ${Global.user!.token}',
  //       HttpHeaders.contentTypeHeader: 'application/json',
  //     });
  //
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> jsonReturn = jsonDecode(response.body);
  //       paginationPost = Pagination<Post>.fromJson(jsonReturn, Post.fromJsonModel);
  //
  //     } else {
  //       print('error: ${response.statusCode} ${response.body}');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  int pageNumber = 0;
  Future<void> _fetchPage(int pageKey) async {
    try {
      if(pageNumber < paginationPost.pageCount){
        pageNumber += 1;
        await Future.delayed(const Duration(seconds: 1));
        await PostService().getPost(pageNumber);
        final isLastPage = paginationPost.pageCount == pageNumber;
        if (isLastPage) {
          _pagingController.appendLastPage(paginationPost.results);
        } else {
          final nextPageKey = pageKey + paginationPost.results.length;
          _pagingController.appendPage(paginationPost.results, nextPageKey);
        }
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, Post>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Post>(
        itemBuilder: (context, item, index) => PostItem(post: item),
      ),
    );
  }

}