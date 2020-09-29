import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

///
/// @created by 文景睿
/// description:魔改源码，将源码中自带的动画效果曲线修改，在安卓平台上有更好的表现效果
///
class CustomTransitionsBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    ///复写动画

    Animation<double> customAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeInOut);

    Animation<double> customSecondaryAnimation = CurvedAnimation(
        parent: secondaryAnimation,
        curve: Curves.easeIn,
        reverseCurve: Curves.easeInOut);

    return CupertinoPageTransition(
        primaryRouteAnimation: customAnimation,
        secondaryRouteAnimation: customSecondaryAnimation,
        child: child,
        linearTransition: true);
  }
}
