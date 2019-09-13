import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarUtil {
  ///显示状态栏
  static Future<void> showStatusBar() async {
    await SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  ///隐藏状态栏
  static Future<void> hideStatusBar() async {
    await SystemChrome.setEnabledSystemUIOverlays([]);
  }

  static void setTransParentStatusBar() {
    SystemUiOverlayStyle _style = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    );
    SystemChrome.setSystemUIOverlayStyle(_style);
  }
}
