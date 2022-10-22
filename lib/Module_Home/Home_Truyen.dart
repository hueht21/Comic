import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_truyen/Module_Account/View_Search.dart';
import 'package:flutter_app_truyen/Module_Comic/Comic_Details.dart';
import 'package:flutter_app_truyen/Module_Item/layout_item_truyen.dart';

import '../Model/Truyen.dart';
import '../Module_Account/View_Notify.dart';
import '../Utils/img_const.dart';
import '../Widgets/image-widget.dart';

class Home_Truyen extends StatefulWidget {
  @override
  State<Home_Truyen> createState() => _Home_TruyenState();
}

class _Home_TruyenState extends State<Home_Truyen> {
  final List<TruyenTranh> _listTruyen = [
    TruyenTranh(
        id: 1,
        url:
            'https://truongquochoc.com/wp-content/uploads/2020/10/top-25-hinh-nen-manga-de-thuong-dep-nhat-the-gioi-3.jpg',
        tenTruyen: 'Phạm nhân tu tiên'),
    TruyenTranh(
        id: 2,
        url:
            'https://reviewnao.com/wp-content/uploads/2022/01/truyen-tranh-ngon-tinh-full-14.jpg',
        tenTruyen: 'Siêu cấp bại gia từ'),
    TruyenTranh(
        id: 3,
        url:
            'https://hostingvietnam.vn/truyen-tranh-theo-the-loai/imager_19120.jpg',
        tenTruyen: 'Tiên đế trở về'),
    TruyenTranh(
        id: 4,
        url:
            'https://canhrau.com/wp-content/uploads/2022/01/truyen-tranh-ngon-tinh-thanh-xuan-vuon-truong-trung-quoc-hinh-2.png',
        tenTruyen: 'Yêu thần kỳ'),
    TruyenTranh(
        id: 5,
        url:
            'https://hostingvietnam.vn/truyen-tranh-theo-the-loai/imager_19120.jpg',
        tenTruyen: 'Yêu thần kỳ'),
    TruyenTranh(
        id: 6,
        url:
            'https://canhrau.com/wp-content/uploads/2022/01/truyen-tranh-ngon-tinh-thanh-xuan-vuon-truong-trung-quoc-hinh-2.png',
        tenTruyen: 'Siêu cấp bại gia từ'),
  ];

  bool isHorizontal = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _panerThongtin(),
                  _layoutListTruyen(false),
                  const SizedBox(
                    height: 10,
                  ),
                  _layoutGridviewTruyen(),
                  _layoutListTruyen(true),
                ],
              ),
            )),
      ),
    );
  }

  Widget _panerThongtin() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset('assets/img/logo.png'),
          const SizedBox(
            width: 15,
          ),
          SizedBox(
            //width: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "Chào buổi sáng",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "Dosis-ExtraLight"),
                ),
                SizedBox(height: 4),
                Text(
                  "Nguyễn Văn A",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Dosis"),
                ),
              ],
            ),
          ),
          const Flexible(fit: FlexFit.tight, child: SizedBox()),

          /// ngăn cách 1 bên trái 1 bên phải
          SizedBox(
            child: Row(
              children: [
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Search()));
                  }, child: const Icon(Icons.search_rounded)),
                const SizedBox(
                  width: 12,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Notify()));
                    },
                    child: const Icon(Icons.notifications))
              ],
            ),
          ),
          // SizedBox(width: 15,),
        ],
      ),
    );
  }

  Widget _layoutListTruyen(bool isHorizontal) {
    if (isHorizontal == false) {
      return Container(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Truyện top",
                  style: TextStyle(
                      fontFamily: "Dosis-Bold",
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.asset(imgUser)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  scrollDirection: Axis.horizontal,
                  //shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ComicDetail(_listTruyen[index].url)));
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Stack(
                              children: [
                                ImageWidget(
                                  width: 340,
                                  height: 195.0,
                                  url: _listTruyen[index].url,
                                ),
                                Positioned(
                                    top: 152,
                                    bottom: 20,
                                    left: 10,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 100,
                                      height: 70,
                                      color: Colors.black,
                                      child: const Text(
                                        "Truyện này hay",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: "Dosis-ExtraLight"),
                                      ),
                                    )),
                              ],
                            )),
                      ),
                    );
                  },
                  itemCount: _listTruyen.length),
            )
          ],
        ),
      );
    } else {
      return SizedBox(
        //padding: const EdgeInsets.only(left: 10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                const Text(
                  "Truyện mới cập nhập",
                  style: TextStyle(
                      fontFamily: "Dosis-Bold",
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  imgUpdate,
                  width: 24,
                  height: 24,
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  // padding: const EdgeInsets.all(5),
                  physics: const NeverScrollableScrollPhysics(),
                  //scrollDirection: Axis.horizontal,
                  //shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ComicDetail(_listTruyen[index].url)));
                      },
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 15),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Stack(
                              children: [
                                ImageWidget(
                                  width: MediaQuery.of(context).size.width,
                                  height: 195.0,
                                  url: _listTruyen[index].url,
                                ),
                                Positioned(
                                    top: 152,
                                    bottom: 20,
                                    left: 10,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 100,
                                      height: 70,
                                      color: Colors.black,
                                      child: const Text(
                                        "Truyện này hay",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: "Dosis-ExtraLight"),
                                      ),
                                    )),
                              ],
                            )),
                      ),
                    );
                  },
                  itemCount: _listTruyen.length),
            )
          ],
        ),
      );
    }
  }

  Widget _layoutGridviewTruyen() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      // color: Colors.blue,

      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Truyện hot",
                style: TextStyle(
                    fontFamily: "Dosis-Bold",
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              const SizedBox(
                width: 20,
              ),
              Image.asset(imgHot),
              const Flexible(fit: FlexFit.tight, child: SizedBox()),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: TextButton(
                    onPressed: () {
                      // setState(() {
                      //
                      // });
                    },
                    child: const Text('Thêm',
                        style: TextStyle(
                            fontFamily: "Dosis-Bold",
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black))),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 450,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200, // độ rộng
                  childAspectRatio: 1 / 1,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ComicDetail(_listTruyen[index].url)));
                      },
                      child: ItemGridView(_listTruyen[index]));
                },
                itemCount: 4,
              ))
        ],
      ),
    );
  }
}
