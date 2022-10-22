import 'package:flutter/material.dart';
import 'package:flutter_app_truyen/Utils/font-style.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Utils/IconConst.dart';
import '../Utils/img_const.dart';
import '../Widgets/image-widget.dart';

class ComicDetail extends StatefulWidget {

  String url;

  ComicDetail(this.url);

  @override
  State<ComicDetail> createState() => _ComicDetailState(url : url);
}

class _ComicDetailState extends State<ComicDetail> {
  String url;
  _ComicDetailState({required this.url});
  int currentTab = 0;
  List<String> listCategory = ['Hành động', 'Viễn tưởng', 'Hài hước'];
  setActiveTab({required int index}) {
    setState(() {
      currentTab = index;
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            _imgHead(context),
            _tabControl(),
            Expanded(
                child: currentTab == 0
                    ? _detailComic()
                    : _chapter())
          ],
        ),
      ),
    );
  }

  Widget _detailComic() {
    return SingleChildScrollView(
      child: Column(
        children: [_detail(), _conment()],
      ),
    );
  }

  Widget _imgHead(BuildContext context) {
    return Stack(
      children: [
        ImageWidget(
          width: MediaQuery.of(context).size.width,
          height: 232,
          url:
              url,
        ),
        Positioned(
            top: 180,
            child: Container(
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(left: 16),
                    color: Colors.black,
                    child: Text(
                      "Yêu thần kỳ",
                      style: TextStyleUtils.font24W400(),
                    ),
                  ),
                  const SizedBox(
                    width: 48,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      imgdownback,
                      width: 44,
                      height: 44,
                    ),
                  ),
                  const SizedBox(
                    width: 38,
                  ),
                  SvgPicture.asset(iconEyes),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    "1.2M",
                    style: TextStyleUtils.font16Bold400()
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SvgPicture.asset(iconHeartRed),
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    "212.56K",
                    style: TextStyleUtils.font16Bold400()
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ))
      ],
    );
  }

  Widget _tabControl() {
    return Container(
      padding: const EdgeInsets.only(left: 77, right: 59),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: .1, color: Colors.grey))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment
            .spaceBetween, //Chia đều không gian thừa giữa các trẻ em.
        children: [
          filterItem(title: "Chi tiết", index: 0),
          filterItem(title: "Chapter", index: 1),
        ],
      ),
    );
  }

  Widget filterItem({required String title, required int index}) {
    bool isActive = index == currentTab; // nếu bằng thì trả về true
    return GestureDetector(
      // click
      onTap: () => setActiveTab(index: index),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: isActive == true ? Colors.red : Colors.transparent,
                    width: 2))),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: Text(
          title,
          style: isActive
              ? TextStyleUtils.font18Nobold().copyWith(color: Colors.red)
              : TextStyleUtils.font18Nobold(),
        ),
      ),
    );
  }

  Widget _detail() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 14),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Cập nhập thứ hai hàng tuần",
                style: TextStyleUtils.font18W600(),
              ),
              const SizedBox(
                width: 7,
              ),
              _coutStart(),
              // const SizedBox(width: 2,),
              Text(
                "4.5",
                style: TextStyleUtils.font18NoboldBland()
                    .copyWith(color: const Color(0xff9E9E9E)),
              ),
              const SizedBox(
                width: 5,
              ),
              SvgPicture.asset(iconCard),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Yêu Thần Vừa Xuất, Ai Dám Tranh Phong Yêu Linh Sư Mạnh Nhất Thánh Linh Đại Lục Nhiếp Li, bởi vì một cuốn sách thần bí Yêu Linh Thời Không mà trở về năm 13 tuổi, tu  luyện mạnh nhất công pháp, mạnh nhất yêu linh chi lực, đột phá tới võ đạo đỉnh phong...Kẻ thù kiếp trước, toàn bộ thanh toán...Nếu như đã trùng sinh, thì kiếp này ta là chúa tể đại lục, Vạn Thần chi Vương,để cho tất cả run rẩy dưới chân ta đi",
            style: TextStyleUtils.font16W500(),
          ),
          _category(),
          const SizedBox(
            height: 13,
          ),
          const Divider(
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget _coutStart() {
    return Row(
      children: [
        for (int i = 0; i < 5; i++) SvgPicture.asset(iconStart),
        const SizedBox(
          width: 2,
        ),
      ],
    );
  }

  Widget _category() {
    // thể loại
    return Container(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        children: [
          for (int i = 0; i < 3; i++)
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 86,
                  height: 21,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xffEEEEEE), width: 1),
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    listCategory[i],
                    style: TextStyleUtils.font16Bold400()
                        .copyWith(color: const Color(0xff9E9E9E)),
                  ),
                ),
                const SizedBox(
                  width: 16,
                )
              ],
            ),
        ],
      ),
    );
  }

  Widget _conment() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Bình luận nổi bật",
                style:
                    TextStyleUtils.font16W600().copyWith(color: Colors.black),
              ),
              const Flexible(fit: FlexFit.tight, child: SizedBox()),
              Text(
                "54321 bình luận",
                style: TextStyleUtils.font16W600()
                    .copyWith(color: const Color(0xff9E9E9E)),
              ),
              SvgPicture.asset(
                iconArrowRight,
                color: const Color(0xff9E9E9E),
              )
            ],
          ),
          const SizedBox(
            height: 28,
          ),
          _detailConment("Cơm rang cháy chảo",
              "Hết cháp rồi vẫn không thấy hay", "lv5", imgAvatarAccout),
          const SizedBox(
            height: 4,
          ),
          _replyComment("Dân chơi đàn", "Bạn nên đổi truyện mới", "lv.15",
              imgAvatarAccout2),
          _detailConment(
              "Nguyễn", "hay !!!!!!!!!!!!!!!!", "lv25", imgAvatarAccout2),
        ],
      ),
    );
  }

  Widget _detailConment(
      String title, String content, String lever, String avatar) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          avatar,
          width: 34,
          height: 34,
        ),
        const SizedBox(
          width: 4,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 212,
              height: 66,
              decoration: BoxDecoration(
                  color: const Color(0xffEEEEEE),
                  border: Border.all(color: const Color(0xffEEEEEE), width: 0),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 6.6,
                      ),
                      Text(
                        title,
                        style: TextStyleUtils.font16W600()
                            .copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 35,
                        height: 15.17,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color(0xffA2D2FF),
                            border: Border.all(
                                color: const Color(0xffEEEEEE), width: 0),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          lever,
                          style: TextStyleUtils.font9W600(),
                        ),
                      )
                    ],
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 6.6, top: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        content,
                        style: TextStyleUtils.font15W400(),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "1 giờ",
                  style: TextStyleUtils.font14W400(),
                ),
                const SizedBox(
                  width: 55,
                ),
                Text("1 thích", style: TextStyleUtils.font14W400()),
                const SizedBox(
                  width: 55,
                ),
                Text("Phản hồi", style: TextStyleUtils.font14W400())
              ],
            ),
            //_replyComment()
            // replyComment
          ],
        )
      ],
    );
  }

  Widget _replyComment(
      String title, String content, String lever, String avarta) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: _detailConment(title, content, lever, avarta),
    );
  }

  Widget _chapter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 16,),
          Align(
            alignment: Alignment.centerLeft,
              child: Text("Chapter mưới nhất: 123", style: TextStyleUtils.font16W600().copyWith(color: Colors.black),)),
          const Divider(
            color:  Color(0xffEEEEEE),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
              return Container(
                  child: Column(
                    children: [
                      const Divider(
                        color:  Color(0xffEEEEEE),
                      ),
                        Row(
                          children: [
                            Text("${index + 1 }. Chapter ${index + 1}", style: TextStyleUtils.font18W600().copyWith(color: const Color(0xff393939)),)
                          ],
                        ),
                      Row(
                        children: [
                          Text("06/02/2022",style: TextStyleUtils.font16W400().copyWith(color: const Color(0xff9E9E9E)),),
                          const SizedBox(width: 6,),
                          SvgPicture.asset(iconEyes, color: const Color(0xff9E9E9E), width: 15 , height: 15,),
                          const SizedBox(width: 6,),
                          Text("1.2M",style: TextStyleUtils.font16Bold400().copyWith(color: const Color(0xff9E9E9E)),),
                          const SizedBox(width: 6,),
                          SvgPicture.asset(iconChat),
                          const SizedBox(width: 6,),
                          Text("5035",style: TextStyleUtils.font16W400().copyWith(color: const Color(0xff9E9E9E)),),
                        ],
                      ),
                    ],
                  ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
