import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///
/// @created by 文景睿
/// description:常量类
///
class Constants {
  Constants._();

  ///这个在判断是否是调试模式时候用，在release模式下设置为false即可
  ///eg：网络请求会打印请求到的数据，如果release模式也打印会耗费性能，所以只在debug模式下打印网络信息
  static const bool isDebug = false;

  static const platform = const MethodChannel('u539699336qq.flutter_douban');

  static const String BASE_URL = 'https://api.douban.com/v2/';
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

  ///影院热映真实请求接口
  static const String URL_HTTP_IN_THEATERS =
      'movie/in_theaters?apikey=$API_KEY';

  ///即将上映真实请求接口
  static const String URL_HTTP_COMING_SOON =
      'movie/coming_soon?apikey=$API_KEY';

  ///口碑真实请求接口
  static const String URL_HTTP_KOU_BEI = 'movie/weekly?apikey=$API_KEY';

  static const String URL_DOU_BAN_HOT_MOVIES =
      'movie/new_movies?apikey=${Constants.API_KEY}';

  ///Top250真实请求接口
  static const String URL_REAL_TOP250 =
      'movie/top250?apikey=${Constants.API_KEY}';
}
