import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_douban/pages/other_pages/image_preview_page.dart';

///
/// @created by 文景睿
/// description:导航跳转工具类
///
class NavigatorUtil {
  static void push(BuildContext context, Widget destinationPage,
      {bool rootNavigator = false}) {
    Navigator.of(context, rootNavigator: rootNavigator).push(
        MaterialPageRoute(builder: (BuildContext context) => destinationPage));
  }

  static void pushToImagePreviewPage(
      BuildContext context, String url, BoxFit boxFit) {
    Navigator.push(
        context,
        PageRouteBuilder(
            opaque: false,
            pageBuilder: (context, anim1, anim2) {
              return ImagePreviewPage(url, boxFit);
            }));
  }
}
