

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../models/category.dart';
import '../../../services/categoryService.dart';
import '../../../size_config.dart';
import '../../category_detail/category_detail_screen.dart';
import '../../category_detail/components/category_item.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BodyState();
  }
}

class BodyState extends State<Body> {
  List<Category> listCategory = [];

  void getCategory(){
    CategoryService().getCategory().then((value) => {
      if(value.statusCode == 200){
        setState(() {
          listCategory = value.data!;
        })
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: ListView.builder(
              itemCount: listCategory.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(listCategory[index].id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Xác nhận"),
                          content: const Text("Bạn có chắc chắn muốn xóa mục này?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Đóng hộp thoại
                              },
                              child: const Text("Hủy"),
                            ),
                            TextButton(
                              onPressed:  () async {
                                Navigator.of(context).pop(); // Đóng hộp thoại
                                bool result = await CategoryService().deleteCategory(listCategory[index].id.toString());
                                if (result) {
                                  // setState(() {
                                  //   listCategory.removeAt(index);
                                  // });
                                  // Hiển thị thông báo xóa thành công
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: const Text('Xóa thành công'),
                                    ),
                                  );
                                } else {
                                  // Hiển thị thông báo xóa thất bại
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Xóa thất bại'),
                                    ),
                                  );
                                }
                              },
                              child: const Text("Xóa"),
                            ),
                          ],
                        );
                      },
                    );

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
                  ), child: CategoryItem(
                  category: listCategory[index],
                  press: () async {
                    await Navigator.pushNamed(
                        context,
                        CategoryDetailScreen.routeName,
                        arguments: {
                          "idCategory" : listCategory[index].id.toString(),
                          "titleName" : "Cập nhật "
                        }
                    ).then((_) {
                      getCategory();
                    });
                  },
                ),
                  //child: CartCard(cart: demoCarts[index]),
                ),
              ),
            ))
    );
  }
}
