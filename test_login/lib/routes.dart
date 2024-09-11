import 'package:flutter/material.dart';

import 'screens/category/category_detail_screen.dart';
import 'screens/category/category_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/init_screen.dart';
import 'screens/post/post_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/sign_in/sign_in_screen.dart';
import 'screens/thong_ke_bao_cao/thong_ke_bao_cao_screen.dart';
import 'screens/user_info/user_info_screen.dart';

final Map<String, WidgetBuilder> routes = {
  InitScreen.routeName: (context) => const InitScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ProfileScreen.routeName: (context) => const  ProfileScreen(),
  UserInfoScreen.routeName: (context) => const UserInfoScreen(),
  ThongKeBaoCaoScreen.routeName: (context) => const ThongKeBaoCaoScreen(),

  PostScreen.routeName: (context) => const PostScreen(),
  CategoryScreen.routeName: (context) => const  CategoryScreen(),
  CategoryDetailScreen.routeName: (context) => const  CategoryDetailScreen(),
};