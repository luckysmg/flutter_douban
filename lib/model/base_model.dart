import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

///
/// @created by 文景睿
/// description:model基类，公用一个hasData的标示和一个必须实现的init初始化方法
///
abstract class BaseModel with ChangeNotifier {
  bool hasData = false;

  void init();
}
