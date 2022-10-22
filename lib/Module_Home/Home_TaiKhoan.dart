import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app_truyen/Module_Account/Edit_Information.dart';
import 'package:flutter_svg/svg.dart';

import '../Utils/IconConst.dart';
import '../Utils/font-style.dart';

class Home_TaiKhoan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              _panerThongTin(),
              _menuItem(
                  title: 'Chỉnh sửa thông tin',
                  icon: iconUser,
                  onTap: () {
                    //chuyển sang screen sửa
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EditInFormation()));
                  }),
              _menuItem(title: 'Nạp tiền', icon: iconWallet),
              _menuItem(
                  title: 'Ngôn ngữ',
                  icon: iconMenu,
                  description: 'Tiếng việt(VN)'),
              _menuItem(title: 'Bình luận của tôi', icon: iconComment),
              _menuItem(title: 'Chính sách và bảo mật', icon: iconSecurity),
              _menuItem(title: 'Phản hồi ý kiến', icon: iconFeedback),
              _menuItem(title: 'Giới thiệu về chúng tôi', icon: iconIntroduce),
              _menuItem(title: 'Đăng xuất', icon: iconLogout, logout: 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _panerThongTin() {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Text("Thông tin",
              style: TextStyleUtils.font16Semibold().copyWith(fontSize: 24)),
          const SizedBox(
            height: 24,
          ),
          Image.asset(
            'assets/img/avarta.png',
            width: 120,
            height: 120,
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Nguyễn Văn A",
            style: TextStyleUtils.font16Semibold().copyWith(fontSize: 24),
          ),
          const SizedBox(
            height: 25,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Divider(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  Widget _menuItem(
      {required String title,
      required String icon,
      String? description,
      VoidCallback? onTap,
      int? logout}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            if (onTap != null) onTap();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 9.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset(icon),
                      const SizedBox(
                        width: 18,
                      ),
                      logout != 1
                          ? Text(
                              title,
                              style: TextStyleUtils.font16Semibold(),
                            )
                          : Text(
                              title,
                              style: TextStyleUtils.font16Semibold_Red(),
                            ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    description != null
                        ? Text(description,
                            style: TextStyleUtils.font16Semibold())
                        : const SizedBox.shrink(),
                    const SizedBox(
                      width: 16,
                    ),
                    logout != 1
                        ? SvgPicture.asset(iconArrowRight)
                        : const SizedBox.shrink(), //Tạo một hộp sẽ trở nên nhỏ như mức độ mà cha mẹ của nó cho phép.
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  // Widget _menuLogOut()
  // {
  //
  // }
}
