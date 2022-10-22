import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Model/Truyen.dart';
import '../Utils/IconConst.dart';
import '../Utils/font-style.dart';
import '../Widgets/image-widget.dart';

class listVerticalComic extends StatelessWidget{
  bool isRank = true;
  int? amount;

  listVerticalComic( this.isRank , this.amount, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    if(isRank == true) {
      return Expanded(
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: amount,
            itemBuilder: (context, index) {
              return _listVertical(isRank,index);
            }),
    );
    } else {
      return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            //padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: amount,
            itemBuilder: (context, index) {
                return _listVertical(isRank,index);
           });
    }
  }
   Widget _listVertical(bool isRank,int index)
   {
     return Container(
       padding: const EdgeInsets.symmetric(vertical: 10),
       decoration: const BoxDecoration(
         border: Border(
           bottom: BorderSide(
               width: .5, color: Color.fromRGBO(238, 238, 238, 2.0)),
         ),
       ),
       child: Row(
         children: [
           ClipRRect(
             borderRadius: BorderRadius.circular(5),
             child: const ImageWidget(
               width: 77,
               height: 100,
               url: 'https://doctruyen3q.info/images/comics/cao-nang-lai-tap-1630765587.jpg',
             ),

           ),
           Expanded(
             child: Container(
               padding: const EdgeInsets.only(left: 5),
               height: 110,
               child: Column(
                 children: [
                   Align(
                     alignment: Alignment.topLeft,
                     child: Text(
                       'Tối cường phản sáo lộ',
                       style: TextStyleUtils.font18NoboldBland(),
                     ),
                   ),
                   const SizedBox(
                     height: 6,
                   ),
                   Align(
                     alignment: Alignment.topLeft,
                     child: Text(
                       'Manhura',
                       style: TextStyleUtils.font16NoboldBland(),
                     ),
                   ),
                 ],
               ),
             ),
           ),
           SizedBox(
             height: 110,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 if (index == 0 && isRank ==true)
                   SvgPicture.asset(iconTop1)
                 else if (index == 1 && isRank ==true)
                   SvgPicture.asset(iconTop2)
                 else if (index == 2 && isRank ==true)
                     SvgPicture.asset(iconTop3)
                   else
                   // SvgPicture.asset(iconTop1),
                     const SizedBox.shrink(),
                 Row(
                   children: [
                     SvgPicture.asset(iconView),
                     const SizedBox(
                       width: 5,
                     ),
                     Text(
                       '1.2 M',
                       style: TextStyleUtils.font16NoboldM(),
                     )
                   ],
                 )
               ],
             ),
           )
         ],
       ),
     );
   }
}