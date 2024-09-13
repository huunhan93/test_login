import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/default_button.dart';
import '../../models/category.dart';
import '../../services/categoryService.dart';
import 'app_color_chart.dart';
import 'bar_chart/bar_chart_sample.dart';
import 'pie_chart/pie_chart_sample.dart';

class ThongKeBaoCaoScreen extends StatefulWidget{
  const ThongKeBaoCaoScreen({super.key});
  static String routeName = "/thong_ke_bao_cao";


  @override
  State<StatefulWidget> createState() {
    return ThongKeBaoCaoScreenState();
  }


}

class ThongKeBaoCaoScreenState extends State<ThongKeBaoCaoScreen>{
  List<Category> listCategories = [Category(id: "", iconColor: 0, name: "",totalPost: 0)];
  int totalPosts = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CategoryService().getCategory().then((value) => {
      if(value.statusCode == 200){
        setState(() {
          listCategories = value.data!;
          for(int i = 0; i < listCategories.length; i++){
            totalPosts = totalPosts + listCategories[i].totalPost;
            Color color;
            switch (i){
              case 0 :
                color = AppColors.contentColorBlue;
              case 1 :
                color = AppColors.contentColorYellow;
              case 2 :
                color = AppColors.contentColorGreen;
              case 3 :
                color = AppColors.contentColorOrange;
              default:
                color = AppColors.contentColorPurple;
            }
            listCategories[i].iconColor = int.parse(color.toString().split('(0x')[1].split(')')[0], radix: 16);
          }
        })
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thống kê"),

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [

              //SpecialOffers(),
              SizedBox(height: 20),
              PieChartSample(listCategories: listCategories),
              SizedBox(height: 20),
              BarChartSample(listCategories: listCategories)
            ],
          ),
        ),
      ),
    );
  }
}