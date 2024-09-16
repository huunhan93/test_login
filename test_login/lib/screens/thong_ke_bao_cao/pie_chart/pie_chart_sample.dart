
import 'package:flutter/material.dart';

import '../../../fl_chart.dart';
import '../../../models/category.dart';
import '../../../services/categoryService.dart';
import '../../../size_config.dart';
import '../app_color_chart.dart';
import 'widgets/indicator.dart';

class PieChartSample extends StatefulWidget{
  final List<Category> listCategories;
  PieChartSample({Key? key, required this.listCategories}) : super(key: key);

  static String routeName = "/pie_char";
  @override
  State<StatefulWidget> createState() {
    return PieChartState();
  }

}

class PieChartState extends State<PieChartSample>{
  int touchedIndex = -1;

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
                    widget.listCategories.length,
                        (index) => Padding(padding: const EdgeInsets.only(left: 20),
                      child: Indicator(
                        color: new Color(widget.listCategories[index].iconColor!),
                        text: widget.listCategories[index].name,
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
    return List.generate(widget.listCategories.length, (i)
    {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      return PieChartSectionData(
        color: new Color(widget.listCategories[i].iconColor),
        value: widget.listCategories[i].totalPost.toDouble() ?? 0 ,
        title: (widget.listCategories[i].totalPost.toString() + ""),
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

