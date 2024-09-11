import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_login/models/category.dart';
import 'package:test_login/screens/post/post_screen.dart';
import 'package:test_login/services/categoryService.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<StatefulWidget> createState() {
    return CategoriesState();
  }
}

class CategoriesState extends State<Categories>{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
              listCategories.length,
                  (index) => Padding(padding: const EdgeInsets.only(left: 20),
                child: CategoryCard(
                  icon: "assets/icons/Flash Icon.svg",
                  text: listCategories[index].name,
                  press: () {
                    Navigator.pushNamed(context, PostScreen.routeName);
                  },
                ),)
          ),
        ],
      ),
    );
  }

}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFFFECDF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(icon),
          ),
          const SizedBox(height: 4),
          Text(text, textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
