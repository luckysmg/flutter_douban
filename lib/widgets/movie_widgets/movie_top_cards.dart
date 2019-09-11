import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_douban/util/toast_util.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// @created by 文景睿
/// description:豆瓣热门下面的水平滑动卡片布局（因为这部分没找到模拟数据，所以就用无状态部件写死了，随便看看效果就行）
///
class MovieCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _bar(),
          _cards(context),
        ],
      ),
    );
  }

  Widget _bar() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(24),
                ScreenUtil().setHeight(12), 0, ScreenUtil().setHeight(15)),
            child: Text(
              '豆瓣榜单',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(34),
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 10),
          child: Text(
            '全部 29 >',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(21),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _cards(context) {
    return Container(
      height: 280,
      child: EasyRefresh(
        ///这里是为了添加弹性效果包了一层EasyRefresh框架
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            _cardItem('card1.png', context),
            _cardItem('card3.jpg', context),
            _cardItem('card2.jpg', context)
          ],
        ),
      ),
    );
  }

  Widget _cardItem(String assetName, BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (assetName) {
          case 'card1.png':
            ToastUtil.show('进入口碑电影页面');
//            NavigatorUtil.push(context, KouBeiPage(), rootNavigator: true);
            break;
          case 'card3.jpg':
            ToastUtil.show('进入Top250电影页面');
            break;
          case 'card2.jpg':
            ToastUtil.show('进入热门电影页面');
            break;
        }
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: ClipRRect(
          child: Image.asset(
            Constants.ASSETS_IMG + assetName,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
