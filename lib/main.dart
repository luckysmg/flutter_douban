import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/main_page.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import 'model/book_music_view_tab_index_model.dart';
import 'routes/custom_transition_builder.dart';
import 'package:auto_orientation/auto_orientation.dart';

///
/// @created by 文景睿
/// description:程序入口

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      textStyle: TextStyle(fontSize: 18),
      dismissOtherOnShow: true,
      handleTouth: true,
      textPadding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      radius: 10,
      backgroundColor: Constants.APP_THEME_COLOR,
      movingOnWindowChange: true,
      child: MaterialApp(
        theme: ThemeData(
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              ///这里由于安卓本身自带的页面也换动画有点傻逼，所以这里自己给安卓平台自己实现了一个，iOS页面的不动
              TargetPlatform.android: CustomTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        debugShowCheckedModeBanner: false,
        title: '豆瓣客户端',
        home: MultiProvider(providers: [
          Provider<BookMusicViewTabIndexModel>.value(
              value: BookMusicViewTabIndexModel()),
        ], child: MainPage()),
      ),
    );
  }
}
