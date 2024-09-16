import 'package:flutter/material.dart';
import 'package:test_login/routes.dart';
import 'package:test_login/screens/init_screen.dart';
import 'package:test_login/screens/sign_in/sign_in_screen.dart';

import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      theme: theme() ,
      initialRoute: SignInScreen.routeName,
      routes: routes,
    );
  }
}
