
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_login/screens/init_screen.dart';

import '../../global.dart';
import '../../helper/keyboard.dart';
import '../../models/user.dart';
import 'components/body.dart';

class SignInScreen extends StatefulWidget{
  const SignInScreen({super.key});
  static String routeName = "/signIn";

  @override
  State<StatefulWidget> createState() {
    return SignInScreenState();
  }

}

class SignInScreenState extends State<SignInScreen>{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //read from local storages
    final user = _prefs.then((SharedPreferences prefs) {
      var json = prefs.getString('user');
      if(json == null){
        return null;
      }
      Map<String, dynamic> userJson = jsonDecode(json);
      final tempUser = User.fromJson(userJson);
      Global.user = tempUser;
      KeyboardUtil.hideKeyboard(context);
      Navigator.pushNamed(context, InitScreen.routeName);
      return tempUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
