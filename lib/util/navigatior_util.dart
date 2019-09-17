import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/pages/other_pages/image_preview_page.dart';
import 'package:flutter_douban/routes/custom_routes.dart';

///
/// @created by 文景睿
/// description:导航跳转工具类
///
class NavigatorUtil {
  static void push(BuildContext context, Widget destinationPage,
      {bool rootNavigator = false,
      bool fullScreenDialog = false,
      bool finishCurrentPage = false}) {
    if (fullScreenDialog) {
      Navigator.of(context, rootNavigator: rootNavigator).push(
        CupertinoPageRoute(
            builder: (BuildContext context) => destinationPage,
            fullscreenDialog: true),
      );
    } else if (finishCurrentPage) {
      Navigator.of(context, rootNavigator: rootNavigator).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => destinationPage,
          ),
          (route) => route == null);
    } else {
      Navigator.of(context, rootNavigator: rootNavigator).push(
          MaterialPageRoute(
              builder: (BuildContext context) => destinationPage));
    }
  }

  static void pushToImagePreviewPage(
      BuildContext context, String url, BoxFit boxFit) {
    Navigator.push(
        context, ImagePreViewPageRoute(ImagePreviewPage(url, boxFit)));
  }
}
