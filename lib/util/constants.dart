import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// @created by 文景睿
/// description:常量类
///
class Constants {
  ///这个在判断是否是调试模式时候用，在release模式下设置为false即可
  ///eg：网络请求会打印请求到的数据，如果release模式也打印会耗费性能，所以只在debug模式下打印网络信息
  static const bool isDebug = false;

  static const String BASE_URL = 'https://api.douban.com';
  static const String ASSETS_IMG = 'assets/images/';
  static final Color APP_THEME_COLOR = Colors.green[600];
  static final Color APP_SKELETON_COLOR = Colors.grey[200];
  static bool isRealNetworkData;
  static const String API_KEY = '0b2bdeda43b5688921839c8ecb20399b';

  ///影院热映模拟地址
  static const String URL_IN_THEATERS = 'in_theaters';

  ///top250模拟地址
  static const String URL_TOP250 = 'top250';

  ///评论模拟地址
  static const String URL_COMMENT = 'comments';

  ///即将上映模拟地址
  static const String URL_COMING_SOON = 'coming_soon';

  static const String USE_REAL_NETWORK = 'use_real_network';

  ///电影长评模拟地址
  static const String URL_MOVIE_LONG_COMMENT = 'movie_long_commments';
}
