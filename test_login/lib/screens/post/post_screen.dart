import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_login/models/post.dart';

import '../../components/product_card.dart';
import '../../models/Product.dart';
import '../home/components/post_item.dart';

class PostScreen extends StatelessWidget{

  const PostScreen({super.key});
  static String routeName = "/post_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post"),
      ),
      body: Column(
        children: [
          // Text(
          //   "Favorites",
          //   style: Theme.of(context).textTheme.titleLarge,
          // ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: demoProducts.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) => PostItem(
                  post: new Post(id: "id", dateCreated: DateTime.now(), authorUserName: "authorUserName", authorName: "authorName", categorySlug: "categorySlug"),
                  //onPress: () => {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}