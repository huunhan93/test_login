import 'package:flutter/cupertino.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget{
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 20),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           const Expanded(child: SearchField()),
           const SizedBox(width: 16),
           // IconBtnWithCounter(
           //   svgSrc: "assets/icons/User.svg",
           //   press: () => Navigator.pushNamed(context, ProfileScreen.routeName),
           // ),
           const SizedBox(width: 8),
           // IconBtnWithCounter(
           //   svgSrc: "assets/icons/Bell.svg",
           //   numOfitem: 3,
           //   press: () {},
           // ),
         ],
       ),
     );
  }


}