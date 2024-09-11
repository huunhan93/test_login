
import 'package:flutter/material.dart';
import 'package:test_login/screens/home/components/posts.dart';

import '../../components/default_button.dart';
import '../../size_config.dart';
import 'components/categories.dart';
import 'components/section_title.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              //HomeHeader(),
              //DiscountBanner(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SectionTitle(
                  title: "Loại bài viết",
                  press: () {},
                ),
              ),
              Categories(),
              //SpecialOffers(),
              SizedBox(height: 20),
              //Posts(),
              //PieChartSample2(),
              SizedBox(height: 20),
              // Padding(padding: EdgeInsets.all(100),

            ],
          ),
        ),
      ),
    );
  }

}