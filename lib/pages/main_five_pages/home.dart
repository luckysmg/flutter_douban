import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/util/Decorations.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_douban/util/toast_util.dart';
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
      appBar: _homeAppBar(),
      body: isLogin ? _alreadyLoginMainBody() : _noLoginMainBody(),
    );
  }

  /// 首页的appbar
  Widget _homeAppBar() {
    return AppBar(
      backgroundColor: Constants.APP_THEME_COLOR,
      title: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              _searchBox(),
              _scanBottom(),
              _searchIcon(),
            ],
          ),
          _emailIcon(),
        ],
      ),
      elevation: 0.0,
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
            left: ScreenUtil.getInstance().setWidth(10),
            top: ScreenUtil().setHeight(18)),
        width: ScreenUtil.getInstance().setWidth(550),
        height: 40,
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(30.0)),
      ),
    );
  }

  ///搜索图标
  Widget _searchIcon() {
    return Container(
      margin: EdgeInsets.only(
          top: ScreenUtil().setHeight(30), left: ScreenUtil().setWidth(25)),
      child: Icon(
        Icons.search,
        color: Colors.grey,
      ),
    );
  }

  Widget _scanBottom() {
    return Container(
      margin: EdgeInsets.only(
          top: ScreenUtil().setHeight(30), left: ScreenUtil().setWidth(480)),
      child: GestureDetector(
        onTap: () {
          debugPrint('打开相机');
        },
        child: Icon(
          Icons.center_focus_weak,
          color: Colors.black38,
        ),
      ),
    );
  }

  ///邮件按钮
  Widget _emailIcon() {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(
          top: ScreenUtil().setHeight(15), left: ScreenUtil().setWidth(50)),
      child: Icon(
        Icons.email,
        color: Colors.white,
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
              width: 100,
              height: 100,
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
              height: 20,
            ),
            Container(
              width: 120,
              height: 45,
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
}
