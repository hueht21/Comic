import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Model/Truyen.dart';
import '../Module_Item/layout_listvertical.dart';
import '../Utils/IconConst.dart';
import '../Utils/font-style.dart';
import '../Widgets/image-widget.dart';

class homeClassify extends StatefulWidget {
  @override
  State<homeClassify> createState() => _homeClassifyState();
}

class _homeClassifyState extends State<homeClassify> {
  int currentTab = 0;
  setActiveTab({required int index}) {
    setState(() {
      currentTab = index;
    });

    //lọc data hoặc là gọi api để lấy dữ liệu rồi hiển thị
  }

  late List<String> listHederTilte;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listHederTilte = ['All', 'Manhua', 'Manga', 'Manhwa', 'Fantsy', 'Comedy'];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              _hederTilte(
                context,
              ),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                     children: [
                        _imgTitleSelect(),
                        _listGridview(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: listVerticalComic(false,20),
                        )
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _hederTilte(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: ListView.builder(
          itemCount: listHederTilte.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            bool isActive = index == currentTab;
            return GestureDetector(
              onTap: () => setActiveTab(index: index),
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: isActive == true
                                  ? Colors.red
                                  : Colors.black12,
                              width: isActive == true ? 3 : 1))),
                  width: 90,
                  height: 60,
                  child: Container(
                    width: 75,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: Text(listHederTilte[index],
                        style: TextStyleUtils.font18NoboldClassify().copyWith(
                            color: isActive == true ? Colors.red : Colors.black,
                            fontWeight: isActive == true
                                ? FontWeight.w600
                                : FontWeight.w400)),
                  )),
            );
          }),
    );
  }

  Widget _imgTitleSelect() {
    return SizedBox(
        child: Column(
        children: [
          const SizedBox(
          height: 27,
        ),
        Row(
          children: [
            const SizedBox(
              width: 24,
            ),
            Text(
              "Manhua",
              style: TextStyleUtils.font24bBold600Classify(),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  ImageWidget(
                    width: MediaQuery.of(context).size.width,
                    height: 200.0,
                    url:
                        "https://hostingvietnam.vn/truyen-tranh-theo-the-loai/imager_19120.jpg",
                  ),

                  Positioned(
                      top: 152,
                      left: 10,
                      child: Container(
                        color: Colors.black,
                        child: Text("Truyện này hay hay",
                            style: TextStyleUtils.font16W600()),
                      ))
                ],
              )),
        ),
      ],
    ));
  }

  Widget _listGridview() {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 12, top: 13),
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 170, // độ rộng
          childAspectRatio: 2 / 3,
        ),
        itemBuilder: (context, index) {
          return Container(
            height: 200,
            padding: const EdgeInsets.only(right: 13),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const ImageWidget(
                    width: 118,
                    height: 150,
                    url:
                        "https://www.ecoeco.org.vn/wp-content/uploads/2019/12/yeu-anh-hon-ca-tu-than-633x1024.jpg",
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text("Tiên đế trở về",
                    style: TextStyleUtils.font16W600()
                        .copyWith(color: const Color(0xff393939)))
              ],
            ),
          );
        },
        itemCount: 3,
      ),
    );
  }
}
