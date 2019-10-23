import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_douban/main_page.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_douban/util/status_bar_util.dart';
import 'package:oktoast/oktoast.dart';
import 'package:orientation/orientation.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/book_music_view_tab_index_model.dart';
import 'routes/custom_transition_builder.dart';
import 'widgets/common_widgets/custom_footer_indicator.dart';
import 'widgets/common_widgets/douban_refresh_header.dart';

///
/// @created by 文景睿
/// description:程序入口
///

void main() {
  Provider.debugCheckInvalidValueType = null;
  StatusBarUtil.setTransParentStatusBar();
  runApp(MultiProvider(providers: [
    Provider<BookMusicViewTabIndexModel>.value(
        value: BookMusicViewTabIndexModel()),
  ], child: MyApp()));
  OrientationPlugin.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
    initCacheData();
    Future.delayed(Duration(milliseconds: 1500), () async {
      setState(() {
        _splashDisplay = false;
        StatusBarUtil.showStatusBar();
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
      child: RefreshConfiguration(
        topHitBoundary: double.infinity,
        bottomHitBoundary: double.infinity,
        maxUnderScrollExtent: double.infinity,
        hideFooterWhenNotFull: true,
        headerTriggerDistance: 60,
        maxOverScrollExtent: double.infinity,
        headerBuilder: () => DouBanRefreshHeader(),
        footerBuilder: () => CustomFooterIndicator(),
        child: MaterialApp(
          theme: ThemeData(
            pageTransitionsTheme: PageTransitionsTheme(
              builders: {
                ///这里由于安卓本身自带的页面也换动画有点傻逼，所以这里自己给安卓平台自己实现了一个
                TargetPlatform.android: CustomTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              },
            ),
            platform: TargetPlatform.android,
          ),
          debugShowCheckedModeBanner: false,
          title: '豆瓣客户端',
//          home: MultiProvider(
//            providers: [
//              Provider<BookMusicViewTabIndexModel>.value(
//                  value: BookMusicViewTabIndexModel()),
//            ],
//            child: _splashDisplay ? _splashScreen() : MainPage(),
//          ),
          home: _splashDisplay ? _splashScreen() : MainPage(),
        ),
      ),
    );
  }

  ///延时闪屏
  Widget _splashScreen() {
    return Scaffold(
      body: Container(
        child: Image.asset(Constants.ASSETS_IMG + 'launch.jpg'),
      ),
    );
  }

  ///初始化缓存数据
  void initCacheData() {
    SharedPreferences.getInstance().then((data) {
      Constants.isRealNetworkData =
          data.getBool(Constants.USE_REAL_NETWORK) ?? false;
    });
  }
}
