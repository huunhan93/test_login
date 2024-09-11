import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../global.dart';
import '../helper/keyboard.dart';
import '../models/user.dart';
import 'home/home_screen.dart';
import 'profile/profile_screen.dart';

const Color inActiveIconColor = Color(0xFFB6B6B6);

class InitScreen extends StatefulWidget{
  const InitScreen({super.key});
  static String routeName = "/";

  @override
  State<StatefulWidget> createState() {
    return InitScreenState();
  }

}

class InitScreenState extends State<InitScreen>{
  int currentSelectedIndex = 0;

  void updateCurrentIndex(int index) {
    setState(() {
      currentSelectedIndex = index;
    });
  }

  final pages = [
    //const PieChartSample2(),
    const HomeScreen(),
    // const FavouriteScreen(),
    // const Center(
    //   child: Text("Chat"),
    // ),
    const ProfileScreen()
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: updateCurrentIndex,
        currentIndex: currentSelectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Shop Icon.svg",
              colorFilter: const ColorFilter.mode(
                inActiveIconColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/Shop Icon.svg",
              colorFilter: const ColorFilter.mode(
                kPrimaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Home",
          ),
          // BottomNavigationBarItem(
          //   icon: SvgPicture.asset(
          //     "assets/icons/Heart Icon.svg",
          //     colorFilter: const ColorFilter.mode(
          //       inActiveIconColor,
          //       BlendMode.srcIn,
          //     ),
          //   ),
          //   activeIcon: SvgPicture.asset(
          //     "assets/icons/Heart Icon.svg",
          //     colorFilter: const ColorFilter.mode(
          //       kPrimaryColor,
          //       BlendMode.srcIn,
          //     ),
          //   ),
          //   label: "Fav",
          // ),
          // BottomNavigationBarItem(
          //   icon: SvgPicture.asset(
          //     "assets/icons/Chat bubble Icon.svg",
          //     colorFilter: const ColorFilter.mode(
          //       inActiveIconColor,
          //       BlendMode.srcIn,
          //     ),
          //   ),
          //   activeIcon: SvgPicture.asset(
          //     "assets/icons/Chat bubble Icon.svg",
          //     colorFilter: const ColorFilter.mode(
          //       kPrimaryColor,
          //       BlendMode.srcIn,
          //     ),
          //   ),
          //   label: "Chat",
          // ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/User Icon.svg",
              colorFilter: const ColorFilter.mode(
                inActiveIconColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/User Icon.svg",
              colorFilter: const ColorFilter.mode(
                kPrimaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Fav",
          ),
        ],
      ),
    );
  }

}