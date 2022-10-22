import 'package:flutter/material.dart';
import 'package:flutter_app_truyen/Module_Item/layout_tabcontrol.dart';
import '../Module_Item/layout_listvertical.dart';
import '../Utils/img_const.dart';
class Home_BXH extends StatefulWidget {
  @override
  State<Home_BXH> createState() => _Home_BXHState();
}

class _Home_BXHState extends State<Home_BXH> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildHeader(),
              TabControl(title1: 'Top tháng', title2: 'Top tuần', title3: 'Top ngày',),
              listVerticalComic(true,20)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 232,
      child: Stack(
        children: [
          Image.asset(imgTilteBackGround, height: 232, fit: BoxFit.fill),
          Positioned(
            top: 76,
            left: 143,
            child: Image.asset(
              imgTitleBXH,
              width: 140,
              height: 117,
            ),
          )
        ],
      ),
    );
  }

}
