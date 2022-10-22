import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageWidget extends StatelessWidget {
  final double width;
  final double height;
  final String url;
  final BoxFit boxFit;
  const ImageWidget(
      {Key? key,
      required this.width,
      required this.height,
      required this.url,
      this.boxFit = BoxFit.cover})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      //imageUrl: 'xxxxx link sai',
       imageUrl: url,
      //load ảnh thành công thì hiển thị cái này
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: imageProvider,
              fit: boxFit,
          ),
        ),
      ),
      //cái này nó hiện khi load ảnh
      placeholder: (context, url) => SizedBox(
        width: width,
        height: height,
        child: Shimmer.fromColors(
          baseColor: Colors.red,
          highlightColor: Colors.yellow,
          child: const SizedBox.shrink(),
        ),
      ),
      // khi lỗi thì hiển thị cại này
      errorWidget: (context, url, error) => Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(5)),
        width: width,
        height: height,
        child: const Center(
          child: Icon(Icons.error),
        ),
      ),
    );
  }
}
