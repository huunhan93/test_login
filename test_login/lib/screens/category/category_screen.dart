import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../category_detail/category_detail_screen.dart';
import 'components/body.dart';

class CategoryScreen extends StatelessWidget{
  const CategoryScreen({super.key});
  static String routeName = "/category_screen";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Loại bài viết"),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.pushNamed(
                    context,
                    CategoryDetailScreen.routeName,
                    arguments: {
                      "titleName" : "Thêm mới ",
                      "idCategory" : "",
                    }
                ).then((_) => {
                  BodyState().getCategory()
                });
              },
              icon: const Icon(Icons.add_box)
          )
        ],
      ),
      body: Body()
    );
  }

}