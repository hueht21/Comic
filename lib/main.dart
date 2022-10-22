import 'package:flutter/material.dart';
import 'package:flutter_app_truyen/Module_DangNhap/DangNhap.dart';

import 'Module_Home/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),


      home: MainDangNhap(),
    );
  }
}
