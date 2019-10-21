import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagePage extends StatelessWidget {
  final List images;
  final File imageFile;
  final bool fromCamera;

  const ImagePage(
      {Key key, this.imageFile, this.images, this.fromCamera = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///在安卓上多选图片后的结果
    if (Platform.isAndroid && !fromCamera) {
      return Scaffold(
        appBar: CupertinoNavigationBar(
          transitionBetweenRoutes: false,
          middle: Text('已选图片'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: ScreenUtil().setHeight(30),
              color: Colors.blue,
            ),
          ),
        ),
        body: EasyRefresh(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2),
            itemBuilder: (context, index) {
              return Image.file(
                File.fromUri(Uri.parse(images[index])),
                fit: BoxFit.cover,
                height: ScreenUtil().setHeight(100),
                width: ScreenUtil().setHeight(100),
              );
            },
            itemCount: images.length,
          ),
        ),
      );
    }
    return Scaffold(
      body: Center(child: Image.file(imageFile)),
    );
  }
}
