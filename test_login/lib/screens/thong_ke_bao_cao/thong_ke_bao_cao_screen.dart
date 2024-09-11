import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../components/default_button.dart';
import 'pie_chart/pie_chart_sample.dart';

class ThongKeBaoCaoScreen extends StatelessWidget{
  const ThongKeBaoCaoScreen({super.key});
  static String routeName = "/thong_ke_bao_cao";

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
              PieChartSample(),
              SizedBox(height: 20),
              Padding(padding: EdgeInsets.all(100),
              child: DefaultButton(
                text: "Làm mới",
                press: () {
                  // if (_formKey.currentState!.validate()) {
                  //   _formKey.currentState!.save();
                  //   // if all are valid then go to success screen
                  //   KeyboardUtil.hideKeyboard(context);
                  //   Navigator.pushNamed(context, HomeScreen.routeName);
                  // }
                  //Navigator.pushNamed(context, InitScreen.routeName);
                },
              ),)
            ],
          ),
        ),
      ),
    );
  }

}