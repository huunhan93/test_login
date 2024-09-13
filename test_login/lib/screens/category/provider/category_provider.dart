import 'package:flutter/material.dart';

import '../../../models/category.dart';
import '../../../services/categoryService.dart';

class CategoryProvider extends ChangeNotifier{
  List<Category> _categories = [];

  List<Category> get categories => _categories;

  Future<void> fetchCategories() async {
    await CategoryService().getCategory().then((value) => {
      if(value.statusCode == 200){
        _categories = value.data!
      }
    });
    notifyListeners();
  }
}