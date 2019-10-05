import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_douban/delegate/sliver_header_delegate.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_douban/util/toast_util.dart';
import 'package:flutter_douban/widgets/common_widgets/refresh_footer.dart';
import 'package:flutter_douban/widgets/movie_widgets//movie_hot_show_grid.dart';
import 'package:flutter_douban/widgets/movie_widgets/movie_page_bottom_list.dart';
import 'package:flutter_douban/widgets/movie_widgets/movie_tab_grid.dart';
import 'package:flutter_douban/widgets/movie_widgets/movie_top_cards.dart';
import 'package:flutter_douban/widgets/common_widgets/refresh_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// @created by 文景睿
/// description:当底部tab书影音，且顶部tab处于'电影'的页面（此页面没用状态管理，新手可以从此页面学起）
///
/// 总体结构是，外层StatelessWidget包裹,内部需要请求模拟数据的组件用StatefulWidget单独拿出来操作避免不需要重绘的部分也被build，增加性能
/// 刷新时需要调用有状态组件的key和成员方法进行刷新数据
///

class MovieView extends StatelessWidget {
  static final ScrollController scrollController = ScrollController();
  static final EasyRefreshController easyRefreshController =
      EasyRefreshController();

  final GlobalKey<MovieTabGridState> _tabGridKey = GlobalKey();
  final GlobalKey<HotMovieGridState> _hotMovieKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return EasyRefresh.custom(
      enableControlFinishLoad: true,
      enableControlFinishRefresh: false,
      header: RefreshHeader(),
      footer: RefreshFooter(),
      controller: easyRefreshController,
      scrollController: scrollController,
      onRefresh: () async {
        ///这里一秒钟是模拟网络请求的时间
        await Future.delayed(Duration(milliseconds: 1000));
        easyRefreshController.finishRefresh(success: true, noMore: false);
      },
      onLoad: () async {
        print('load');
        await Future.delayed(Duration(milliseconds: 500));
        easyRefreshController.finishLoad(success: true, noMore: false);
      },
      slivers: <Widget>[
        SliverToBoxAdapter(child: _headerView()),
        SliverToBoxAdapter(child: _introductionImage('introduction.jpg')),
        SliverToBoxAdapter(child: MovieTabGrid(key: _tabGridKey)),
        SliverToBoxAdapter(child: HotMovieGrid(key: _hotMovieKey)),
        SliverToBoxAdapter(child: _introductionImage('introduction2.png')),
        SliverToBoxAdapter(child: MovieCards()),
        SliverToBoxAdapter(child: _introductionImage('shanghai.png')),
        SliverToBoxAdapter(child: _forYouRecommendText()),
        SliverPersistentHeader(
          pinned: true,
          floating: true,
          delegate: SliverHeaderDelegate(
              maxHeight: 40, minHeight: 40, child: _recommendSelectTab()),
        ),
        SliverToBoxAdapter(child: _moviePoster()),
        MovieBottomList(),
      ],
    );
  }

  ///顶部四个按钮
  Widget _headerView() {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          _headerItem('find_movie.png', '找电影'),
          _headerItem('douban_top.png', '豆瓣榜单'),
          _headerItem('douban_guess.png', '豆瓣猜'),
          _headerItem('douban_film_list.png', '豆瓣片单'),
        ],
      ),
    );
  }

  ///最上面四个图标的widget的每一个item图标
  Widget _headerItem(String assetImageName, String text) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
            top: ScreenUtil().setHeight(24),
            bottom: ScreenUtil().setHeight(24)),
        child: GestureDetector(
          onTap: () {
            ToastUtil.show('点击了' + text);
          },
          child: Column(
            children: <Widget>[
              Image.asset(
                Constants.ASSETS_IMG + assetImageName,
                height: ScreenUtil().setHeight(60),
              ),
              SizedBox(height: 5),
              Text(
                text,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: ScreenUtil().setSp(24),
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///宣传图
  Widget _introductionImage(String assetName) {
    return Container(
      width: 350,
      child: Image.asset(Constants.ASSETS_IMG + assetName),
    );
  }

  ///为你推荐
  Widget _forYouRecommendText() {
    return Container(
      margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(24),
          ScreenUtil().setHeight(18), 0, ScreenUtil().setHeight(10)),
      child: Text(
        '为你推荐',
        style: TextStyle(
            fontSize: ScreenUtil().setSp(34), fontWeight: FontWeight.w600),
      ),
    );
  }

  ///'为你推荐' 下方吸附在顶部的tab布局(这里tab的点击就不做了，也没有数据，所以就写出吸顶布局就意思意思一下）
  Widget _recommendSelectTab() {
    return Container(
      color: Colors.grey[50],
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                _recommendTabItem('近期'),
                _recommendTabItem('经典'),
                _recommendTabItem('小众'),
                _availablePlayItem(),
              ],
            ),
          ),
          _filterButton(),
        ],
      ),
    );
  }

  ///吸顶布局上单个按钮Item
  Widget _recommendTabItem(String text) {
    return Container(
      margin: EdgeInsets.only(left: 12),
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(20),
          top: ScreenUtil().setHeight(8),
          right: ScreenUtil().setWidth(20),
          bottom: ScreenUtil().setHeight(8)),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[350]),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: ScreenUtil().setSp(16), fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _availablePlayItem() {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(24)),
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(14),
          top: ScreenUtil().setHeight(8),
          right: ScreenUtil().setWidth(14),
          bottom: ScreenUtil().setHeight(8)),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[350]),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.play_circle_outline, size: ScreenUtil().setHeight(18)),
          Text(
            '可播放',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(18), fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  ///筛选按钮
  Widget _filterButton() {
    return Container(
      margin: EdgeInsets.only(right: ScreenUtil().setHeight(18)),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.find_replace,
            size: ScreenUtil().setHeight(24),
          ),
          Text(
            '筛选',
            style: TextStyle(fontSize: ScreenUtil().setSp(21)),
          ),
        ],
      ),
    );
  }

  ///下面的大的电影海报
  Widget _moviePoster() {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: ScreenUtil().setHeight(20),
          horizontal: ScreenUtil().setWidth(18)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(Constants.ASSETS_IMG + 'movie_poster.png'),
      ),
    );
  }
}
