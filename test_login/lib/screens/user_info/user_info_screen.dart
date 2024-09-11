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
        if(value.statusCode == 200){
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
        title: Text("Thông tin tài khoản"),
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

                    if(value.statusCode == 200){
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
                suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg")
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
                suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
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
                suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg")
              ),
              onChanged: (String? value) => {
                // member.phoneNumber = value!
                setState(() {
                  member.phoneNumber = value ?? "";
                })
              },
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              //onSaved: (newValue) => phoneNumber = newValue,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  //removeError(error: kPhoneNumberNullError);
                }
                return;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  //addError(error: kPhoneNumberNullError);
                  return "";
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "Phone Number",
                hintText: "Enter your phone number",
                // If  you are using latest version of flutter then lable text and hint text shown like this
                // if you r using flutter less then 1.20.* then maybe this is not working properly
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
              ),
            ),
          ],

        ),
      )
    );
  }


}