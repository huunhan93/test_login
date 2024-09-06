import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:test_login/models/UserRequest.dart';

import '../../components/custom_surfix_icon.dart';
import '../../constants.dart';
import '../../global.dart';
import '../../models/user.dart';
import '../../services/userService.dart';
import '../../size_config.dart';

class UserInfoScreen extends StatefulWidget{
  const UserInfoScreen({super.key});
  static String routeName = "/user_info";

  @override
  State<StatefulWidget> createState() {
    return UserInfoScreenState();
  }

}

class UserInfoScreenState extends State<UserInfoScreen>{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  User member = User(
      id: "",
      username: ""
  );

  TextEditingController _controllerFirstName = TextEditingController(text: "");
  TextEditingController _controllerLastName = TextEditingController(text: "");
  TextEditingController _controllerPhoneNumber = TextEditingController(text: "");



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final user = _prefs.then((SharedPreferences prefs) {
      var json = prefs.getString('user');
      if(json == null){
        return null;
      }
      Map<String, dynamic> userJson = jsonDecode(json);
      final tempUser = User.fromJson(userJson);
      UserService().getMember(tempUser.id.toString()).then((value) => {
        if(value.message == '200'){
          setState(() {
            member = value.data!;
            _controllerFirstName.text = member.firstName!;
            _controllerLastName.text = member.lastName!;
            _controllerPhoneNumber.text = member.phoneNumber!;
          })
        }
      });

      return tempUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
        actions: [
          IconButton(
              onPressed: (){
                var newUserRequest = UserRequest(
                    id: member.id,
                    firstName: member.firstName,
                    lastName: member.lastName,
                    phoneNumber: member.phoneNumber,
                    isActive: true
                );
                UserService().updateMember(newUserRequest).then((value) => {

                    if(value.message == '200'){
                      setState(() {
                          Fluttertoast.showToast(
                              msg: "Update success!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                      })
                    }
                });
              },
              icon: const Icon(Icons.save)
          )
        ],
      ),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: ListView(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                //hintText: 'What do people call you?',
                labelText: 'First Name',
              ),
              controller: _controllerFirstName,
              onChanged: (String? value) => {
                setState(() {
                  member.firstName = value ?? "";
                })
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                //hintText: 'What do people call you?',
                labelText: 'Last Name',
              ),
              controller: _controllerLastName,
              onChanged: (String? value) => {
                setState(() {
                  member.lastName = value ?? "";
                })
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _controllerPhoneNumber,
              decoration: const InputDecoration(
                //hintText: 'What do people call you?',
                labelText: 'Phone number',
              ),
              onChanged: (String? value) => {
                // member.phoneNumber = value!
                setState(() {
                  member.phoneNumber = value ?? "";
                })
              },
            ),
          ],

        ),
      )
    );
  }


}