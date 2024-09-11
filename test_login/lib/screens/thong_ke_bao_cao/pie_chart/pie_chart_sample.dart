
import 'package:flutter/material.dart';

import '../../../fl_chart.dart';
import '../../../models/category.dart';
import '../../../services/categoryService.dart';
import '../../../size_config.dart';
import 'widgets/indicator.dart';

class PieChartSample extends StatefulWidget{
  const PieChartSample({super.key});
  static String routeName = "/pie_char";
  @override
  State<StatefulWidget> createState() {
    return PieChartState();
  }

}

class PieChartState extends State<PieChartSample>{
  List<Category> listCategories = [Category(id: "", iconColor: 0, name: "",totalPost: 0)];
  int touchedIndex = -1;
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
    SizeConfig().init(context);
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(
                    listCategories.length,
                        (index) => Padding(padding: const EdgeInsets.only(left: 20),
                      child: Indicator(
                        color: new Color(listCategories[index].iconColor!),
                        text: listCategories[index].name,
                        isSquare: true,
                      ),)
                )
              ]
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    var i = 0;
    return List.generate(listCategories.length, (i)
    {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      return PieChartSectionData(
        color: new Color(listCategories[i].iconColor),
        value: listCategories[i].totalPost.toDouble() ?? 0 ,
        title: (listCategories[i].totalPost.toString() + ""),
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: AppColors.mainTextColor1,
          shadows: shadows,
        ),
      );
    });
  }

}

class AppColors {
  static const Color primary = contentColorCyan;
  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}