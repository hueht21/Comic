import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_truyen/Utils/font-style.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Module_Item/layout_listvertical.dart';
import '../Utils/IconConst.dart';
import '../Utils/img_const.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int checkSearch = 0;
  int checkInput = 0;
  setClick({required int check}) {
    setState(() {
      checkSearch = check;
    });
  }

  setClickInput({required int check}) {
    setState(() {
      checkInput = check;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Tìm kiếm",
          style: TextStyleUtils.font24W700(),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _headerSearch(context),
              const SizedBox(
                height: 24,
              ),
              _category(),
              checkSearch == 0 ? _searchInformation() : _resultSearch()
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerSearch(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 21,
        ),
        Container(
          decoration: BoxDecoration(
              color: const Color(0xffF5F5F5),
              borderRadius: BorderRadius.circular(10)),
          width: MediaQuery.of(context).size.width - 35,
          height: 44,
          child: Row(
            children: [
              const SizedBox(
                width: 12.3,
              ),
              InkWell(
                  onTap: () {
                    setClick(check: 1);
                  },
                  child: SvgPicture.asset(iconSearch)),
              const SizedBox(
                width: 12,
              ),
              InkWell(
                onTap: () {
                    setClickInput(check: 1);
                },
                child: SizedBox(
                    width: 220,
                    height: 40,
                    child: Align(
                        alignment: Alignment.center,
                        child: checkInput == 0
                            ? Text(
                                "Khoa học, viễn tưởng, manga ,v.v",
                                style: TextStyleUtils.font16Bold400()
                                    .copyWith(color: const Color(0xff9E9E9E)),
                              )
                            : TextField(
                                decoration: const InputDecoration(
                                    hintText: "Khoa học, viễn tưởng,manga"),
                                style: TextStyleUtils.font16Bold400()
                                    .copyWith(color: const Color(0xff9E9E9E)),
                              ))),
              ),
              const Flexible(fit: FlexFit.tight, child: SizedBox()),
              InkWell(
                  onTap: () {
                    setClick(check: 1);
                  },
                  child: SvgPicture.asset(iconClose)),
              const SizedBox(
                width: 12.3,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _category() // thể loại
  {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          boxCategory("Truyện hót", 0xffFF865E, imgHotS),
          const SizedBox(
            width: 32,
          ),
          boxCategory("Có thể bạn thích", 0xffA2D2FF, imgHearWhite),
        ],
      ),
    );
  }

  Widget boxCategory(String title, int color, String img) {
    return Container(
      width: 150,
      height: 56,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(color), borderRadius: BorderRadius.circular(5)),
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyleUtils.font16W600().copyWith(color: Colors.white),
            ),
            const SizedBox(
              width: 8,
            ),
            Image.asset(
              img,
              width: 24,
              height: 24,
            )
          ],
        ),
      ),
    );
  }

  Widget _searchInformation() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          Text(
            "Tìm Kiếm Nổi Bật",
            style: TextStyleUtils.font18W600().copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 21,
          ),
          Row(
            children: [
              _titleSearch("Trọng sinh Đô Thu Tiên"),
              const SizedBox(
                width: 5,
              ),
              _titleSearch("Tiên đế trở về"),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              _titleSearch("Nghịch tiên"),
              const SizedBox(
                width: 5,
              ),
              _titleSearch("Cơm tró"),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              _titleSearch("Cuộc sống đảo hoang"),
              const SizedBox(
                width: 5,
              ),
              _titleSearch("Trùng sinh"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _titleSearch(String title) {
    return Container(
      // width: 169,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: const Color(0xff9E9E9E),
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            title,
            style: TextStyleUtils.font16W600(),
          )),
    );
  }

  Widget _resultSearch() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      alignment: Alignment.topLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 24,
          ),
          Text(
            "Kết quả tìm kiếm",
            style: TextStyleUtils.font18W600().copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 21,
          ),
          listVerticalComic(false, 1),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Được đề xuất",
            style: TextStyleUtils.font18W600().copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 21,
          ),
          listVerticalComic(false, 12)
        ],
      ),
    );
  }
}
