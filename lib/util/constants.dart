import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// @created by 文景睿
/// description:常量类
///
class Constants {
  static const String BASE_URL = 'https://douban.uieee.com/v2';
  static const String ASSETS_IMG = 'assets/images/';
  static final Color APP_THEME_COLOR = Colors.green[600];
  static final Color APP_skeleton_COLOR = Colors.grey[200];

  ///影院热映模拟地址
  static const String URL_IN_THEATERS = 'in_theaters';

  ///top250模拟地址
  static const String URL_TOP250 = 'top250';

  ///评论模拟地址
  static const String URL_COMMENT = 'comments';

  ///即将上映模拟地址
  static const String URL_COMMING_SOON = 'coming_soon';

  ///电影长评模拟地址
  static const String URL_MOVIE_LONG_COMMENT = 'movie_long_commments';
}
