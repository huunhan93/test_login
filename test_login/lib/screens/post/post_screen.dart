import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: demoProducts.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              key: Key(demoProducts[index].id.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                // setState(() {
                //   demoCarts.removeAt(index);
                // });
              },
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    SvgPicture.asset("assets/icons/Trash.svg"),
                  ],
                ),
              ),
              child: ProductCard( product: demoProducts[index], onPress: () {  },),
            ),
          ),
        ),
      ),
    );
  }

}