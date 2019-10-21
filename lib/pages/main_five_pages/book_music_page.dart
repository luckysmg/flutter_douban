import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_douban/model/book_music_view_tab_index_model.dart';
import 'package:flutter_douban/pages/book_music_pages/book_page.dart';
import 'package:flutter_douban/pages/book_music_pages/image_page.dart';
import 'package:flutter_douban/pages/book_music_pages/movie_page.dart';
import 'package:flutter_douban/pages/book_music_pages/music_page.dart';
import 'package:flutter_douban/pages/other_pages/camera_page.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_douban/util/navigatior_util.dart';
import 'package:flutter_douban/util/toast_util.dart';
import 'package:flutter_douban/widgets/common_widgets/custom_scroll_behavior.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tab_bar_no_ripple/flutter_tab_bar_no_ripple.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
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
    return ScrollConfiguration(
      ///去掉水波纹效果
      behavior: CustomScrollBehavior(),
      child: TabBarView(
          physics: BouncingScrollPhysics(),
          controller: _controller,
          children: _tabBarViews),
    );
  }

  Widget _tabBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(30),
      child: Container(
        alignment: Alignment.topLeft,
        child: TabBarNoRipple(
          labelPadding: EdgeInsets.only(
              left: ScreenUtil().setWidth(20),
              right: ScreenUtil().setWidth(20),
              bottom: ScreenUtil().setHeight(10)),
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
              _scanButton(),
            ],
          ),
          _selectImageIcon(),
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
          top: ScreenUtil().setHeight(26), left: ScreenUtil().setWidth(25)),
      child: Icon(
        Icons.search,
        color: Colors.grey,
        size: ScreenUtil().setHeight(40),
      ),
    );
  }

  Widget _scanButton() {
    return Container(
      margin: EdgeInsets.only(
          top: ScreenUtil().setHeight(30), left: ScreenUtil().setWidth(480)),
      child: GestureDetector(
        onTap: _openCamera,
        child: Icon(
          Icons.center_focus_weak,
          color: Colors.black38,
          size: ScreenUtil().setHeight(35),
        ),
      ),
    );
  }

  ///邮件按钮
  Widget _selectImageIcon() {
    return GestureDetector(
      onTap: _showDialog,
      child: Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(
            top: ScreenUtil().setHeight(15), left: ScreenUtil().setWidth(50)),
        child: Icon(
          Icons.email,
          size: ScreenUtil().setHeight(40),
          color: Colors.black38,
        ),
      ),
    );
  }

  void _openCamera() async {
    await PermissionHandler()
        .requestPermissions([PermissionGroup.camera]).then((_) async {
      PermissionStatus cameraPermission = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.camera);
      if (cameraPermission == PermissionStatus.granted) {
        NavigatorUtil.push(context, CameraPage(),
            fullScreenDialog: true, rootNavigator: true);
      } else {
        ToastUtil.show('权限获取失败');
      }
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: ScreenUtil().setHeight(250),
            width: ScreenUtil().setWidth(600),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: ScreenUtil().setHeight(40),
                ),
                _dialogButton('相册获取', context),
                SizedBox(
                  height: ScreenUtil().setHeight(40),
                ),
                _dialogButton('拍照获取', context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _dialogButton(String text, BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (text == '相册获取') {
          _pickImage(ImageSource.gallery);
        } else {
          _pickImage(ImageSource.camera);
        }
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setHeight(10),
            horizontal: ScreenUtil().setWidth(10)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none),
        ),
      ),
    );
  }

  void _pickImage(ImageSource source) async {
    var fromCamera = false;
    if (source == ImageSource.camera) {
      fromCamera = true;
    }

    if (Platform.isAndroid && source == ImageSource.gallery) {
      Constants.platform.invokeMethod('getPhoto').then((data) async {
        ///防止界面卡顿
        await Future.delayed(Duration(milliseconds: 350));

        NavigatorUtil.push(
            context,
            ImagePage(
              images: data,
            ),
            rootNavigator: true);
      });
      return;
    }
    ImagePicker.pickImage(source: source).then((data) {
      if (data != null) {
        NavigatorUtil.push(
            context,
            ImagePage(
              imageFile: data,
              fromCamera: fromCamera,
            ),
            rootNavigator: true);
      }
    });
  }
}
