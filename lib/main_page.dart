import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/pages/book_music_pages/movie_page.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'model/book_music_view_tab_index_model.dart';
import 'pages/main_five_pages/book_music_page.dart';
import 'pages/main_five_pages/group_page.dart';
import 'pages/main_five_pages/home.dart';
import 'pages/main_five_pages/market_page.dart';
import 'pages/main_five_pages/person_page.dart';

///
/// @created by 文景睿
/// description:最上层的框架层页面
///
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<BottomNavigationBarItem> barItems = [
    BottomNavigationBarItem(
      title: Text('首页'),
      activeIcon: Image.asset(
        Constants.ASSETS_IMG + "ic_tab_home_active.png",
      ),
      icon: Image.asset(Constants.ASSETS_IMG + "ic_tab_home_normal.png"),
    ),
    BottomNavigationBarItem(
      title: Text('书影音'),
      activeIcon:
          Image.asset(Constants.ASSETS_IMG + "ic_tab_subject_active.png"),
      icon: Image.asset(Constants.ASSETS_IMG + "ic_tab_subject_normal.png"),
    ),
    BottomNavigationBarItem(
      title: Text('小组'),
      activeIcon: Image.asset(Constants.ASSETS_IMG + "ic_tab_group_active.png"),
      icon: Image.asset(Constants.ASSETS_IMG + "ic_tab_group_normal.png"),
    ),
    BottomNavigationBarItem(
      title: Text('市集'),
      activeIcon: Image.asset(Constants.ASSETS_IMG + "ic_tab_shiji_active.png"),
      icon: Image.asset(Constants.ASSETS_IMG + "ic_tab_shiji_normal.png"),
    ),
    BottomNavigationBarItem(
      title: Text('我的 '),
      activeIcon:
          Image.asset(Constants.ASSETS_IMG + "ic_tab_profile_active.png"),
      icon: Image.asset(Constants.ASSETS_IMG + "ic_tab_profile_normal.png"),
    ),
  ];

  List<Widget> pages = [
    HomePage(),
    BookMusicPage(),
    GroupPage(),
    MarketPage(),
    PersonPage(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: false)
          ..init(context);

    ///由于iOS平台风格的Scaffold自带懒加载效果，所以不用本身的Scaffold
    return CupertinoTabScaffold(
      resizeToAvoidBottomInset: true,
      tabBar: _tabBar(),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) => pages[index],
        );
      },
    );
  }

  Widget _tabBar() {
    return CupertinoTabBar(
      items: barItems,
      currentIndex: _currentIndex,
      activeColor: Constants.APP_THEME_COLOR,
      onTap: (index) {
        ///如果当前tab就在'书影音'，那么用户再次点击就会触发交互效果,并且不在执行setState
        if (_currentIndex == index && index == 1) {
          setInteractiveEffectForBookMusicPage();
          return;
        }
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }

  ///设置书影音的点击tab两次的交互效果
  void setInteractiveEffectForBookMusicPage() {
    ///若现在处于页面最顶端，那么进行刷新操作
    int tabViewIndex =
        Provider.of<BookMusicViewTabIndexModel>(context).getIndexValue();
    switch (tabViewIndex) {
      case 0:
        MovieView.scrollController.animateTo(0,
            duration: Duration(milliseconds: 300), curve: Curves.decelerate);
        break;
    }
  }
}
