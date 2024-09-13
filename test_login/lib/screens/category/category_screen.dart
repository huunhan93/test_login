import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_login/screens/category/provider/category_provider.dart';

import '../category_detail/category_detail_screen.dart';
import 'components/body.dart';

class CategoryScreen extends StatelessWidget{
  const CategoryScreen({super.key});
  static String routeName = "/category_screen";

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return FutureBuilder<void>(
        future: categoryProvider.fetchCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          else if (snapshot.hasError)
          {
            return Text('Có lỗi xảy ra');
          }else{
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

                        });
                      },
                      icon: const Icon(Icons.add_box)
                  )
                ],
              ),
              body: Body(),
              //bottomNavigationBar: CheckoutCard(),
            );
          }
    });
  }

}