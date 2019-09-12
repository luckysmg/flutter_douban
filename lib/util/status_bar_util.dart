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
}
