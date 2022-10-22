import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_truyen/Utils/font-style.dart';
import 'package:flutter_svg/svg.dart';

import '../Utils/IconConst.dart';
import '../Utils/img_const.dart';

class EditInFormation extends StatefulWidget {
  @override
  State<EditInFormation> createState() => _EditInFormationState();
}

class _EditInFormationState extends State<EditInFormation> {
  var dropdownValue = "adf";
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
          "Chỉnh sửa thông tin",
          style: TextStyleUtils.font24bBold600Classify(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: _information()),
      ),
    );
  }

  Widget _information() {
    return Column(
      children: [
        const SizedBox(
          height: 96,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            width: 381,
            height: 59,
            color: const Color(0xffFAFAFA),
            child: TextField(
              style: TextStyleUtils.font16W600().copyWith(color: Colors.black),
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xffFAFAFA), width: 2.0),
                  ),
                  labelText: 'Nguyễn Văn'),
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            width: 381,
            height: 59,
            color: const Color(0xffFAFAFA),
            child: TextField(
              style: TextStyleUtils.font16W600().copyWith(color: Colors.black),
              decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xffFAFAFA), width: 2.0),
                  ),
                  labelText: 'Anh'),
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
              width: 381,
              height: 59,
              color: const Color(0xffFAFAFA),
              child: Row(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text("01/09/2022",
                              style: TextStyleUtils.font16W600().copyWith(
                                color: Colors.black,
                              )))),
                  const Flexible(fit: FlexFit.tight, child: SizedBox()),
                  Container(
                      padding: const EdgeInsets.only(right: 19),
                      child: SvgPicture.asset(iconCanlendar))
                ],
              )),
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
              width: 381,
              height: 59,
              color: const Color(0xffFAFAFA),
              child: TextField(
                // maxLines: 8,
                style:
                    TextStyleUtils.font16W600().copyWith(color: Colors.black),
                decoration: InputDecoration(
                  // contentPadding: EdgeInsets.only(right: 15),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xffFAFAFA), width: 2.0),
                  ),
                  labelText: 'Email',
                  suffixIconConstraints:
                      const BoxConstraints(minHeight: 24, minWidth: 24),
                  suffixIcon: Align(
                    widthFactor: 2.7,
                    heightFactor: 1.0,
                    child: SvgPicture.asset(
                      iconEmail,
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              )),
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
              width: 381,
              height: 59,
              color: const Color(0xffFAFAFA),
              child: Row(
                children: [
                  const SizedBox(
                    width: 17,
                  ),
                  Image.asset(
                    imgVietNam,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                  SvgPicture.asset(iconCombobox),
                  const SizedBox(
                    width: 13,
                  ),
                  Expanded(
                    child: TextField(
                      style: TextStyleUtils.font16W600()
                          .copyWith(color: Colors.black),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffFAFAFA), width: 2.0),
                          ),
                          labelText: '+84569865232'),
                    ),
                  ),
                ],
              )),
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
              width: 381,
              height: 59,
              color: const Color(0xffFAFAFA),
              child: Row(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text("Nam",
                              style: TextStyleUtils.font16W600().copyWith(
                                color: Colors.black,
                              )))),
                  const Flexible(fit: FlexFit.tight, child: SizedBox()),
                  Container(
                      padding: const EdgeInsets.only(right: 19),
                      child: SvgPicture.asset(iconPlay))
                ],
              )),
        ),
       const SizedBox(height: 100,),
        Container(
            width: MediaQuery.of(context).size.width-24,
            height: 48,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all( const Color(0xffA2D2FF)),
                  ),
                  child: Text("Cập nhập", style: TextStyleUtils.font16W600(),)),
            ))
      ],
    );
  }
}
