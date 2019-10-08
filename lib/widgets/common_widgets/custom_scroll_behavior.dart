import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// @created by 文景睿
/// description:去掉越界水波纹
///
class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
