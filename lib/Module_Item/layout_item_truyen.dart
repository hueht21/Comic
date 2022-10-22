import 'package:flutter/material.dart';
import 'package:flutter_app_truyen/Model/Truyen.dart';

import '../Widgets/image-widget.dart';

class  ItemGridView extends StatelessWidget{
  //const ItemGridView({Key? key}) : super(key: key);
  final TruyenTranh _truyenTranh;


  ItemGridView(this._truyenTranh);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: 190,
        height: 150,
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              // child: Image(
              //   fit: BoxFit.cover,
              //   width: 184,
              //   height: 150,
              //   image: NetworkImage(
              //       _truyenTranh.url
              //   ),
              // ),
              child : ImageWidget(
                width: 184,
                height: 150,
                url:  _truyenTranh.url,
              ),

            ),
            const SizedBox(height: 10,),
            Row(
              children: const [
                 Text("Truyện này hay",  style: TextStyle(fontFamily: "Dosis-ExtraBold",fontWeight: FontWeight.bold , fontSize: 16)),
              ],
            )
          ],
        ),
    );
  }

}