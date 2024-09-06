import 'package:flutter/material.dart';

import 'screens/pie_chart/pie_chart_sample2.dart';
import 'screens/home/home_screen.dart';
import 'screens/init_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/sign_in/sign_in_screen.dart';
import 'screens/user_info/user_info_screen.dart';

final Map<String, WidgetBuilder> routes = {
  InitScreen.routeName: (context) => const InitScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ProfileScreen.routeName: (context) => const  ProfileScreen(),
  UserInfoScreen.routeName: (context) => const UserInfoScreen(),

  PieChartSample2.routeName: (context) => const PieChartSample2(),
};