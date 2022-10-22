import 'package:flutter/material.dart';

import '../Model/Truyen.dart';
import '../Module_Item/layout_tabcontrol.dart';
import '../Utils/font-style.dart';
import '../Widgets/image-widget.dart';

class homeFavourite extends StatefulWidget {
  @override
  State<homeFavourite> createState() => _homeFavouriteState();
}

class _homeFavouriteState extends State<homeFavourite> {

  final List<TruyenTranh> _listTruyen = [
    TruyenTranh(
        id: 1,
        url:
        'https://media.cocomic.net/images/fullsize/2021/09/06/co-ay-ngay-nao-cung-len-hot-search.jpg',
        tenTruyen : 'Yêu thần kỳ'),

    TruyenTranh(
      id: 2,
      url:
      'https://media.cocomic.net/images/fullsize/2021/04/11/ac-ma-than-yeu.jpg', tenTruyen : 'Tiên đế trở về'
    ),
    TruyenTranh(
        id: 3,
        url:
        'https://i.pinimg.com/736x/fe/05/53/fe05536467d1e1f55f987b05dc88651c.jpg', tenTruyen : 'Siêu cấp bại gia từ'),
    TruyenTranh(
        id: 4,
        url:
        'https://i.pinimg.com/736x/fe/05/53/fe05536467d1e1f55f987b05dc88651c.jpg', tenTruyen : 'Phạm nhân tu tiên'),
    TruyenTranh(
        id: 5,
        url:
        'https://cdn.vietnammoi.vn/2019/4/25/e2ae914b2a4855c95bfd04345b94d596-155617991273924461059.jpg',tenTruyen : 'Phạm nhân tu tiên'),
    TruyenTranh(
        id: 6,
        url:
        'https://i.pinimg.com/736x/fe/05/53/fe05536467d1e1f55f987b05dc88651c.jpg',tenTruyen : 'Phạm nhân tu tiên')
  ];
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
                _firstTitle(context),
                TabControl(
                  title1: 'Theo dõi',
                  title2: 'Lịch sử',
                  title3: 'Tải xuống',
                ),
                _listFavorites()
              ],
            )),
      ),
    );
  }

  Widget _firstTitle(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox.shrink(),
          Row(
            children: [
              const SizedBox(
                width: 120,
              ),
              Center(
                child: Text(
                  "Yêu thích",
                  style: TextStyleUtils.font24bBold600Classify(),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "Chỉnh sửa",
                  style: TextStyleUtils.font18NoboldClassify(),
                )),
          )
        ],
      ),
    );
  }

  Widget _listFavorites() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: ListView.builder(
              itemCount: _listTruyen.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(top: 24),
                  child: Row(
                    children: [
                      ImageWidget(
                        width: 118,
                        height: 150,
                        url: _listTruyen[index].url,
                      ),
                      Expanded(
                          child: Container(
                              height: 150,
                              padding: const EdgeInsets.only(left: 11),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 5,),
                                  _itemFavourite(_listTruyen[index].tenTruyen, true),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  _itemFavourite("Lần trước xem đến: Chapter", false),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  _itemFavourite("Chapter mưới nhất: 269", false),
                          ],
                        ),
                      ))
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }

  Widget _itemFavourite(String title, bool styleB) {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: styleB == true
            ? TextStyleUtils.font18Nobold()
            : TextStyleUtils.font16Bold400(),
      ),
    );
  }
}
