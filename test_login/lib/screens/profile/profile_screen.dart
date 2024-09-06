
import 'package:flutter/material.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});
  static String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Profile"),
        // ),
        body: SafeArea(child: Body())
    );
  }
  
}