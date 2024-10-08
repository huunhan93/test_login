import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_login/screens/thong_ke_bao_cao/thong_ke_bao_cao_screen.dart';

import '../../../global.dart';
import '../../../helper/keyboard.dart';
import '../../category/category_screen.dart';
import '../../user_info/user_info_screen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    return BodyState();
  }

}

class BodyState extends State<Body>{
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

    @override
    Widget build(BuildContext context) {
      return SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            ProfilePic(),
            SizedBox(height: 20),
            ProfileMenu(
              text: "Tài khoản của tôi",
              icon: "assets/icons/User Icon.svg",
              press: () => {
                Navigator.pushNamed(context, UserInfoScreen.routeName)
              },
            ),
            ProfileMenu(
              text: "Xem thống kê",
              icon: "assets/icons/Bell.svg",
              press: () {
                Navigator.pushNamed(context, ThongKeBaoCaoScreen.routeName);
              },
            ),
            ProfileMenu(
              text: "Quản lý loại bài viết",
              icon: "assets/icons/Settings.svg",
              press: () {
                Navigator.pushNamed(context, CategoryScreen.routeName);
              },
            ),
            // ProfileMenu(
            //   text: "Help Center",
            //   icon: "assets/icons/Question mark.svg",
            //   press: () {},
            // ),
            ProfileMenu(
              text: "Đăng xuất",
              icon: "assets/icons/Log out.svg",
              press: () async {
                final SharedPreferences prefs = await _prefs;
                // Remove data
                final success = await prefs.remove('user');
                //render login page
                Global.clearData();
                KeyboardUtil.hideKeyboard(context);
                Navigator.pop(context);
                //   SystemNavigator.pop();
                // }
              },
            ),
          ],
        ),
      );
    }
}