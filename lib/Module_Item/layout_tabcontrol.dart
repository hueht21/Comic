import 'package:flutter/material.dart';

import '../Utils/font-style.dart';

class TabControl extends StatefulWidget
{
  late String title1;
  late String title2;
  late String title3;
  int? amout;
  TabControl({Key? key, required this.title1, required this.title2, required this.title3,this.amout}) : super(key: key);

  @override
  State<TabControl> createState() => _TabControlState(title1,title2,title3,amout);
}

class _TabControlState extends State<TabControl> {
  int currentTab = 0;

  late String title1;
  late String title2;
  late String title3;
  int? amout;

  _TabControlState(this.title1, this.title2, this.title3,this.amout);

  setActiveTab({required int index}) {
    setState(() {
      currentTab = index;
    });

    //lọc data hoặc là gọi api để lấy dữ liệu rồi hiển thị
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: .1, color: Colors.grey))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          filterItem(title: title1, index: 0),
          filterItem(title: title2, index: 1),
          filterItem(title: title3, index: 2),
        ],
      ),
    );

  }

  Widget filterItem({required String title, required int index}) {
    bool isActive = index == currentTab;// nếu bằng thì trả về true
    return GestureDetector(// click
      onTap: () => setActiveTab(index: index),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: isActive == true ? Colors.red : Colors.transparent,
                    width: 2))),
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          title,
          style: isActive
              ? TextStyleUtils.font18Nobold().copyWith(color: Colors.red)
              : TextStyleUtils.font18Nobold(),
        ),
      ),
    );
  }
}