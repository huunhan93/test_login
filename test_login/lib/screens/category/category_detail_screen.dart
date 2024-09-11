

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../components/custom_surfix_icon.dart';
import '../../models/category.dart';
import '../../services/categoryService.dart';
import '../../size_config.dart';

class CategoryDetailScreen extends StatefulWidget{
  const CategoryDetailScreen({super.key});
  static String routeName = "/category_detail_screen";

  @override
  State<StatefulWidget> createState() {
    return CategoryDetailScreenState();
  }
}

class CategoryDetailScreenState extends State<CategoryDetailScreen>{
  TextEditingController _controllerName = TextEditingController(text: "");
  String titleName = "";
  String idCategory = "";
  String nameCategory = "";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // put your logic from initState here
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    titleName = arguments['titleName'];
    idCategory = arguments['idCategory'];
    if( idCategory != ""){
      CategoryService().getCategoryById(idCategory).then((value) => {
        if(value.statusCode == 200){
          setState(() {
            _controllerName.text = value.data!.name;
          })
        }
      });
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(titleName + "loại bài viết"),
        actions: [
          IconButton(
              onPressed: (){
                var newCategory = Category(
                    id: idCategory,
                    name: _controllerName.text, iconColor: 0, totalPost: 0,
                );
                if(idCategory != ""){
                  CategoryService().updateCategory(newCategory).then((value) => {

                    if(value.statusCode == 200){
                      setState(() {
                        // Hiển thị thông báo xóa thành công
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Cập nhật thành công'),
                          ),
                        );
                        Navigator.pop(context);
                      })
                    }
                  });
                }else{
                  CategoryService().addCategory(newCategory).then((value) => {

                    if(value.statusCode == 200){
                      setState(() {
                        // Hiển thị thông báo xóa thành công
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Thêm mới thành công'),
                          ),
                        );
                        Navigator.pop(context);
                      })
                    }
                  });
                }

              },
              icon: const Icon(Icons.save)
          )
        ],
      ),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: ListView(
            children: [
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  //hintText: 'What do people call you?',
                    labelText: 'Tên loại bài viết',
                    suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Settings.svg")
                ),
                controller: _controllerName,
                onChanged: (String? value) => {
                  setState(() {
                    nameCategory = value ?? "";
                  })
                },
              ),
            ],
          )
      )
    );
  }

}