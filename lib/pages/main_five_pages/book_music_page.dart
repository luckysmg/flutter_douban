import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_douban/model/book_music_view_tab_index_model.dart';
import 'package:flutter_douban/pages/book_music_tab_pages/book_page.dart';
import 'package:flutter_douban/pages/book_music_tab_pages/movie_page.dart';
import 'package:flutter_douban/pages/book_music_tab_pages/music_page.dart';
import 'package:flutter_douban/util/Decorations.dart';
import 'package:flutter_douban/util/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tab_bar_no_ripple/flutter_tab_bar_no_ripple.dart';
import 'package:provider/provider.dart';

///
/// @created by 文景睿
/// description:书影音页面
///
class BookMusicPage extends StatefulWidget {
  @override
  _BookMusicState createState() => _BookMusicState();
}

class _BookMusicState extends State<BookMusicPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  final _tabBarViews = [
    MovieView(),
    MusicView(),
    BookView(),
  ];

  var _tabs = [
    Text(
      '电影',
      style: TextStyle(fontSize: ScreenUtil().setSp(24)),
    ),
    Text(
      '音乐',
      style: TextStyle(fontSize: ScreenUtil().setSp(24)),
    ),
    Text(
      '读书',
      style: TextStyle(fontSize: ScreenUtil().setSp(24)),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this)
      ..addListener(() {
        ///利用provider获取实时的所在页面索引，在两次点击底部tab的时候返回顶部使用（如果不判断就无法知道哪个现在需要返回顶部）
        Provider.of<BookMusicViewTabIndexModel>(context)
            .setIndexValue(_controller.index);
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: false)
          ..init(context);

    return Scaffold(
      appBar: _topAppBar(),
      body: _mainBodyView(),
    );
  }

  Widget _mainBodyView() {
    return TabBarView(controller: _controller, children: _tabBarViews);
  }

  Widget _tabBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(40),
      child: Container(
        alignment: Alignment.topLeft,
        child: TabBarNoRipple(
          labelPadding: EdgeInsets.all(10),
          isScrollable: true,
          unselectedLabelColor: Colors.grey,
          tabs: _tabs,
          controller: _controller,
          labelColor: Colors.black,
          indicatorColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.label,
        ),
      ),
    );
  }

  Widget _topAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      brightness: Brightness.light,
      title: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Stack(
            children: <Widget>[
              _searchBox(),
              _searchIcon(),
              _scanBottom(),
            ],
          ),
          _emailIcon(),
        ],
      ),
      bottom: _tabBar(),
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
    return GestureDetector(
      onTap: () {
        ToastUtil.show('进入邮件');
      },
      child: Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(
            top: ScreenUtil().setHeight(15), left: ScreenUtil().setWidth(50)),
        child: Icon(
          Icons.email,
          color: Colors.black38,
        ),
      ),
    );
  }
}