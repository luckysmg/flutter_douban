import 'package:auto_orientation/auto_orientation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_douban/main_page.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_douban/util/status_bar_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/book_music_view_tab_index_model.dart';
import 'routes/custom_transition_builder.dart';

///
/// @created by 文景睿
/// description:程序入口
///

void main() {
  AutoOrientation.portraitAutoMode();
  Provider.debugCheckInvalidValueType = null;
  StatusBarUtil.setTransParentStatusBar();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _splashDisplay = true;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((data) {
      Constants.isRealNetworkData =
          data.getBool(Constants.USE_REAL_NETWORK) ?? false;
    });
    Future.delayed(Duration(milliseconds: 1500), () async {
      setState(() {
        _splashDisplay = false;
      });
    });
  }

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
        home: MultiProvider(
          providers: [
            Provider<BookMusicViewTabIndexModel>.value(
                value: BookMusicViewTabIndexModel()),
          ],
          child: _splashDisplay ? _splashScreen() : MainPage(),
        ),
      ),
    );
  }

  Widget _splashScreen() {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(),
        ),
        body: Container(
          child: Image.asset(Constants.ASSETS_IMG + 'launch.jpg'),
        ));
  }
}
