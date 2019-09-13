import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// @created by 文景睿
/// description:图片详情放大页面
///

class ImagePreviewPage extends StatefulWidget {
  final String url;
  final BoxFit fit;

  ImagePreviewPage(this.url, this.fit);

  @override
  _ImagePreviewPageState createState() => _ImagePreviewPageState();
}

class _ImagePreviewPageState extends State<ImagePreviewPage> {
  Color color;

  @override
  Widget build(BuildContext context) {
    return ExtendedImageSlidePage(
      resetPageDuration: Duration(milliseconds: 0),
      slidePageBackgroundHandler: (offset, size) {
        ///这里根据他的offset的状态回调设置背景的透明度

        if (offset.dy >= 0) {
          if (offset.dy <= 255) {
            print(offset.dy);
            return Color.fromARGB(255 - ((offset.dy) * 0.9).toInt(), 0, 0, 0);
          } else {
            return Color.fromARGB(25, 0, 0, 0);
          }
        } else {
          if (offset.dy >= -255) {
            return Color.fromARGB(255 + (offset.dy * 0.9).toInt(), 0, 0, 0);
          } else {
            return Color.fromARGB(25, 0, 0, 0);
          }
        }
      },
      child: Hero(
        tag: this.widget.url,
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: ExtendedImage.network(
            this.widget.url,
            fit: this.widget.fit,
            enableSlideOutPage: true,
            cache: true,
            mode: ExtendedImageMode.gesture,
          ),
        ),
      ),
    );
  }
}
