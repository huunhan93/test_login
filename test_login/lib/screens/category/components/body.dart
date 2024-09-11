

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/category.dart';
import '../../../services/categoryService.dart';
import '../../../size_config.dart';
import '../category_detail_screen.dart';
import 'category_item.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  List<Category> listCategories = [Category(id: "", iconColor: 0, name: "",totalPost: 0)];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CategoryService().getCategory().then((value) => {
      if(value.statusCode == 200){
        setState(() {
          listCategories = value.data!;
        })
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: listCategories.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(listCategories[index].id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Xác nhận"),
                    content: Text("Bạn có chắc chắn muốn xóa mục này?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Đóng hộp thoại
                        },
                        child: Text("Hủy"),
                      ),
                      TextButton(
                        onPressed:  () async {
                          Navigator.of(context).pop(); // Đóng hộp thoại
                          bool result = await CategoryService().deleteCategory(listCategories[index].id.toString());
                          if (result) {
                            setState(() {
                              listCategories.removeAt(index);
                            });
                            // Hiển thị thông báo xóa thành công
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Xóa thành công'),
                              ),
                            );
                          } else {
                            // Hiển thị thông báo xóa thất bại
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Xóa thất bại'),
                              ),
                            );
                          }
                        },
                        child: Text("Xóa"),
                      ),
                    ],
                  );
                },
              );

            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],
              ),
            ), child: CategoryItem(
            category: listCategories[index],
            press: (){
              Navigator.pushNamed(
                  context,
                  CategoryDetailScreen.routeName,
                  arguments: {
                    "idCategory" : listCategories[index].id.toString(),
                    "titleName" : "Cập nhật "
                  }
              );
            },
          ),
            //child: CartCard(cart: demoCarts[index]),
          ),
        ),
      ),
    );
  }
}
