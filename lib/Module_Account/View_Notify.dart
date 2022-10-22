import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_truyen/Utils/font-style.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Utils/IconConst.dart';
import '../Utils/img_const.dart';

class Notify extends StatelessWidget {
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
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
          ),
          backgroundColor: Colors.white,
          title: Text(
            "Thông báo",
            style: TextStyleUtils.font24bBold600Classify()
                .copyWith(color: Colors.black),
          )),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 33,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Trước đó",
                    style: TextStyleUtils.font18Nobold()
                        .copyWith(color: Colors.black),
                  ),
                ),
                _listNotify(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listNotify(BuildContext context) {
    return ListView.builder(
            itemCount: 20,
             shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _iteamNotify();
            },
    );

  }

  Widget _iteamNotify() {
    return SizedBox(
      width: 380,
      height: 100,
      child: Row(
        children: [
          Image.asset(
            imgAvatar,
            width: 68,
            height: 68,
          ),
          const SizedBox(
            width: 11,
          ),
          Expanded(
              child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Trần Vô Danh đã trả lời bình luận \n của bạn trong truyện Võ Đạo ",
                  style: TextStyleUtils.font16Bold400(),
                  maxLines: 20,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "15 phút trước",
                  style:
                      TextStyleUtils.font13W300().copyWith(color: Colors.black),
                ),
              )
            ],
          )),
          SvgPicture.asset(iconDetail)
        ],
      ),
    );
  }
}
