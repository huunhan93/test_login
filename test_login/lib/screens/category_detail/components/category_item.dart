import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/category.dart';
import '../../../size_config.dart';

class CategoryItem extends StatelessWidget{

  const CategoryItem({
    Key? key,
    required this.category,
    required this.press,
  }) : super(key: key);

  final Category category;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Row(
        children: [
          const SizedBox(height: 4),
          Text(category.name, textAlign: TextAlign.center,),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
  
}