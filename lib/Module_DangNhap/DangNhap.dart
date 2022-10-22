import 'package:flutter/material.dart';
import 'package:flutter_app_truyen/Module_Home/Home.dart';
import 'package:flutter_app_truyen/icon/google_icons.dart';

class MainDangNhap extends StatefulWidget {
  @override
  State<MainDangNhap> createState() => _MainDangNhapState();
}

class _MainDangNhapState extends State<MainDangNhap> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SafeArea(

          child: SingleChildScrollView(
            child:  SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  const SizedBox(height: 114),
                  _logoDangNhap(),
                  const SizedBox(height: 60),
                  _inputDangNhap(context)
                ],
              ),
            ),
          )
        ));
  }

  Widget _logoDangNhap() {
    return Row(
      children: [
        Container(
          width: 195,
          height: 96,
          padding: const EdgeInsets.only(left: 22),
          child: const Text(
            "Đăng nhập tài khoản",
            style: TextStyle(fontFamily: "Dosis", fontSize: 35),
          ),
        )
      ],
    );
  }

  Widget _inputDangNhap(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 26,

      //height: MediaQuery.of(context).size.height - 20,

      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Nhập Email",
              prefixIcon: Icon(Icons.email),
            ),
          ),
          const SizedBox(height: 24),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Nhập mật khẩu",
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          CheckboxListTile(
            contentPadding: const EdgeInsets.only(left: 1, top: 10),
            value: isChecked,
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (newValues) {
              setState(() {
                if(isChecked == false)
                {
                  isChecked = true;
                }
                else
                {
                  isChecked =false;
                }
              });

            },
            title: const Text("Ghi nhớ"),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()));
                },
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)))),
                child: const Text("Đăng nhập",
                    style: TextStyle(color: Colors.white, fontSize: 16))),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                "Quên mật khẩu ?",
                style: TextStyle(color: Colors.black, fontSize: 16),
              )),
          const SizedBox(
            height: 10,
          ),
          const Text("hoặc đăng nhập với ",
              style: TextStyle(color: Colors.black, fontSize: 14)),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 52,
            //alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Column contents vertically,
              crossAxisAlignment: CrossAxisAlignment
                  .center, //Center Column contents horizontally,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: const Icon(
                    Icons.facebook,
                    size: 40,
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: const Icon(
                    Google.google,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 52,
            //alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, //Center Column contents vertically,
              crossAxisAlignment: CrossAxisAlignment
                  .center, //Center Column contents horizontally,
              children: [
                Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: const Text("Bạn chưa có tài khoản ?",
                        style: TextStyle(color: Colors.black, fontSize: 16))),
                const SizedBox(
                  width: 10,
                ),
                Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: TextButton(
                        onPressed: () {}, child: const Text("Đăng ký ngay"))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
