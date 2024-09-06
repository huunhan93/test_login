
import 'package:flutter/material.dart';

import '../../size_config.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(child: Text("Home"))
    );
  }

}