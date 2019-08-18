import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

///
/// @created by 文景睿
/// description:自定义刷新头布局,继承了Header
///
class RefreshHeader extends ClassicalHeader {
  @override
  String get refreshedText => '刷新完成';

  @override
  String get refreshingText => '刷新中';

  @override
  String get refreshReadyText => '松手刷新';

  @override
  String get refreshText => '下拉刷新';

  @override
  String get refreshFailedText => '刷新失败';

  @override
  String get infoText => "上一次更新： %T";

  @override
  bool get showInfo => true;

  @override
  Color get infoColor => Colors.black;
}
