import 'package:flutter/material.dart';
import 'package:flutter_app_truyen/Module_Home/Home_BXH.dart';
import 'package:flutter_app_truyen/Module_Home/Home_Classify.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Utils/IconConst.dart';
import '../Utils/font-style.dart';
import 'Home_Favourite.dart';
import 'Home_TaiKhoan.dart';
import 'Home_Truyen.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final Fracment = [
    Home_Truyen(),
    Home_BXH(),
    homeClassify(),
    homeFavourite(),
    Home_TaiKhoan()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Fracment[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              iconHome,
              color: _selectedIndex == 0 ? Colors.orange : Colors.grey,
            ),
            label: 'Truyên',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              iconRank,
              color: _selectedIndex == 1 ? Colors.orange : Colors.grey,
            ),
            label: 'BXH',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              iconMenu,
              color: _selectedIndex == 2 ? Colors.orange : Colors.grey,
            ),
            label: 'Phân loại',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              iconHeart,
              color: _selectedIndex == 3 ? Colors.orange : Colors.grey,
            ),
            label: 'Yêu thích',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              iconUser,
              color: _selectedIndex == 4 ? Colors.orange : Colors.grey,
            ),
            label: 'Thông tin',

          ),
        ],
        unselectedLabelStyle: TextStyleUtils.font12(),
        selectedLabelStyle: TextStyleUtils.font12(),
        selectedFontSize: 12,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
