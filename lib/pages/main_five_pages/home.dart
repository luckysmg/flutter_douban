import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_douban/pages/other_pages/notification_result_page.dart';
import 'package:flutter_douban/util/Decorations.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_douban/util/navigatior_util.dart';
import 'package:flutter_douban/util/toast_util.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// @created by 文景睿
/// description:首页
///
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: false)
          ..init(context);
    return Scaffold(
      appBar: _appBar(),
      body: isLogin ? _alreadyLoginMainBody() : _noLoginMainBody(),
    );
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.green,
      elevation: 0.5,
      brightness: Brightness.dark,
      title: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Stack(
            children: <Widget>[
              _searchBox(),
              _searchIcon(),
              _scanButton(),
            ],
          ),
          _emailIcon(),
        ],
      ),
    );
  }

  /// 搜索框
  Widget _searchBox() {
    return GestureDetector(
      onTap: () {
        ToastUtil.show('进入搜索页面');
      },
      child: Container(
        margin: EdgeInsets.only(
            left: ScreenUtil().setWidth(10), top: ScreenUtil().setHeight(18)),
        width: ScreenUtil.getInstance().setWidth(550),
        height: ScreenUtil().setHeight(60),
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(30.0)),
      ),
    );
  }

  ///搜索图标
  Widget _searchIcon() {
    return Container(
      margin: EdgeInsets.only(
          top: ScreenUtil().setHeight(34), left: ScreenUtil().setWidth(25)),
      child: Image.asset(
        Constants.ASSETS_IMG + 'search.png',
        height: ScreenUtil().setHeight(30),
      ),
    );
  }

  Widget _scanButton() {
    return Container(
      margin: EdgeInsets.only(
          top: ScreenUtil().setHeight(30), left: ScreenUtil().setWidth(480)),
      child: GestureDetector(
        child: Image.asset(
          Constants.ASSETS_IMG + 'scan.png',
          height: ScreenUtil().setHeight(35),
        ),
      ),
    );
  }

  ///邮件按钮
  Widget _emailIcon() {
    return GestureDetector(
      onTap: () async {
        handleNotification();
      },
      child: Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(
            top: ScreenUtil().setHeight(15), left: ScreenUtil().setWidth(50)),
        child: Icon(
          Icons.email,
          size: ScreenUtil().setHeight(40),
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _noLoginMainBody() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(160),
              child: Image.asset(
                  Constants.ASSETS_IMG + 'ic_new_empty_view_default.png'),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Text(
                '登录后查看关注人的动态',
                style: TextStyle(
                    color: Colors.black38, fontSize: ScreenUtil().setSp(30)),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(24),
            ),
            Container(
              width: ScreenUtil().setWidth(240),
              height: ScreenUtil().setHeight(60),
              decoration: Decorations.homeButtonDecoration,
              child: CupertinoButton(
                  padding: EdgeInsets.all(0),
                  child: Text(
                    '去登录',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(30),
                      fontWeight: FontWeight.w400,
                      color: Constants.APP_THEME_COLOR,
                    ),
                  ),
                  onPressed: () {
                    ToastUtil.show('已经登陆');
                    isLogin = true;
                    setState(() {});
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _alreadyLoginMainBody() {
    return Center(
      child: Text(
        '初来豆瓣，写点什么吧',
        style: TextStyle(fontSize: ScreenUtil().setSp(30)),
      ),
    );
  }

  void handleNotification() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    var initializationSettingsAndroid =
        AndroidInitializationSettings('indicator');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, '测试推送通知', '测试推送内容', platformChannelSpecifics,
        payload: 'item x');
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    NavigatorUtil.push(context, NotificationResultPage(), rootNavigator: true);
  }
}
