import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/entity/coming_soon_entity.dart';
import 'package:flutter_douban/entity/hot_show_entity.dart';
import 'package:flutter_douban/http/dio_util.dart';
import 'package:flutter_douban/http/mock_request.dart';
import 'package:flutter_douban/pages/other_pages/movie_detail_page.dart';
import 'package:flutter_douban/util/Decorations.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_douban/util/navigatior_util.dart';
import 'package:flutter_douban/util/toast_util.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../entity_factory.dart';

///
/// @created by 文景睿
/// description:由于带Tab的网格布局这一块是一个单独的有状态部件，所以单独拿出来，作为一个类进行操作
///

class MovieTabGrid extends StatefulWidget {
  MovieTabGrid({Key key}) : super(key: key);

  @override
  MovieTabGridState createState() => MovieTabGridState();
}

class MovieTabGridState extends State<MovieTabGrid>
    with AutomaticKeepAliveClientMixin {
  bool isHotShow = true;

  ///保存页面状态
  @override
  bool get wantKeepAlive => true;

  HotShowEntity _hotShowEntity;
  ComingSoonEntity _comingSoonEntity;
  List<HotShowSubject> _hotShowSubjectData;
  List<ComingSoonSubject> _comingSoonSubjectData;

  @override
  void initState() {
    super.initState();
    if (Constants.isRealNetworkData) {
      _requestHttpData();
    } else {
      _requestMockData();
    }
  }

  ///请求模拟json数据
  Future _requestMockData() async {
    ///这里用600毫秒延迟来模拟网络请求时间
    Timer(Duration(milliseconds: 300), () async {
      ///请求影院热映数据
      await MockRequest.mock(Constants.URL_IN_THEATERS).then((data) {
        _hotShowEntity = EntityFactory.generateOBJ(data);
        _hotShowSubjectData = _hotShowEntity.subjects;
        return;
      });

      ///请求即将上映数据
      await MockRequest.mock(Constants.URL_COMING_SOON).then((data) {
        _comingSoonEntity = EntityFactory.generateOBJ(data);
        _comingSoonSubjectData = _comingSoonEntity.subjects;
        return;
      }).whenComplete(() {
        setState(() {});
        return;
      });
    });
  }

  ///真实网络请求
  void _requestHttpData() async {
    ///请求影院热映数据
    await DioUtil.getInstance()
        .get(url: '/v2/movie/in_theaters?apikey=${Constants.API_KEY}')
        .then((data) {
      _hotShowEntity = EntityFactory.generateOBJ(data);
      _hotShowSubjectData = _hotShowEntity.subjects;
    });

    ///请求即将上映数据
    await DioUtil.getInstance()
        .get(url: '/v2/movie/coming_soon?apikey=${Constants.API_KEY}')
        .then((data) {
      _comingSoonEntity = EntityFactory.generateOBJ(data);
      _comingSoonSubjectData = _comingSoonEntity.subjects;
    });

    setState(() {});
  }

  ///刷新数据
  Future refreshData() async {
    await Future.delayed(Duration(milliseconds: 1000));
    return null;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (_hotShowSubjectData == null || _comingSoonSubjectData == null) {
      return _emptyDataBody();
    } else {
      return _filledDataBody();
    }
  }

  ///等待json数据加载完毕后显示的布局
  Widget _filledDataBody() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          _tabs(true),
          _movieGrid(true),
        ],
      ),
    );
  }

  ///数据加载完成前的占位布局
  Widget _emptyDataBody() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          _tabs(false),
          _movieGrid(false),
        ],
      ),
    );
  }

  ///点击的tab布局
  Widget _tabs(bool hasData) {
    return Container(
      margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(24)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                _hotShowTab(hasData),
                _comingSoonTab(hasData),
              ],
            ),
          ),
          _rightSideButton(hasData),
        ],
      ),
    );
  }

  ///影院热映
  Widget _hotShowTab(bool hasData) {
    return Container(
      child: GestureDetector(
        onTap: () {
          ///如果有数据才进行状态改变
          if (hasData) {
            setState(() {
              isHotShow = true;
            });
          }
        },
        child: Column(
          children: <Widget>[
            Text(
              '影院热映',
              style: isHotShow
                  ? TextStyle(
                      fontSize: ScreenUtil().setSp(34),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )
                  : TextStyle(
                      fontSize: ScreenUtil().setSp(28),
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
              height: 2,
              width: ScreenUtil().setWidth(140),
              color: isHotShow ? Colors.black : Colors.white12,
            )
          ],
        ),
      ),
    );
  }

  ///即将上映
  Widget _comingSoonTab(bool hasData) {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(16)),
      child: GestureDetector(
        onTap: () {
          if (hasData) {
            setState(() {
              isHotShow = false;
            });
          }
        },
        child: Column(
          children: <Widget>[
            Text(
              '即将上映',
              style: isHotShow
                  ? TextStyle(
                      fontSize: ScreenUtil().setSp(28),
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    )
                  : TextStyle(
                      fontSize: ScreenUtil().setSp(34),
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
              height: 2,
              width: ScreenUtil().setWidth(140),
              color: isHotShow ? Colors.white12 : Colors.black,
            )
          ],
        ),
      ),
    );
  }

  ///右边的全部按钮
  Widget _rightSideButton(bool hasData) {
    if (!hasData) {
      return Container();
    } else {
      return GestureDetector(
        onTap: () {
          if (hasData) {
            ToastUtil.show('点击全部');
          }
        },
        child: Container(
          margin: EdgeInsets.only(
            bottom: ScreenUtil().setHeight(10),
          ),
          child: Text(
            isHotShow
                ? '全部 ${_hotShowSubjectData.length} >'
                : '全部 ${_comingSoonSubjectData.length} >',
            style: TextStyle(
              fontSize: ScreenUtil().setSp(21),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }
  }

  ///电影的网格视图
  Widget _movieGrid(bool hasData) {
    return Container(
      child: GridView.builder(
          padding: EdgeInsets.only(top: 0),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: isHotShow ? 0.48 : 0.42,
          ),
          itemBuilder: (context, index) {
            ///若没有数据直接返回骨架布局
            if (!hasData) {
              return _skeletonGridItem();
            } else {
              ///若有数据，根据tab的高亮状态来判定显示哪个布局的item，因为两个item的有些布局属性不一样
              return isHotShow
                  ? _hotShowMovieGridItem(index)
                  : _comingSoonMovieGridItem(index);
            }
          }),
    );
  }

  ///影院热映的网格item
  Widget _hotShowMovieGridItem(int index) {
    return GestureDetector(
      onTap: () {
        ///由于这里是在tabView页面上面跳转，由于iOS的tab脚手架每个页面都是一个独立的导航栏，所以加上rootNavigator参数才能正常
        ///否则安卓上按返回键就直接退出app！
        NavigatorUtil.push(
          context,
          MovieDetailPage(
            movieId: _hotShowSubjectData[index].id,
          ),
          rootNavigator: true,
        );
      },
      child: Column(
        children: <Widget>[
          ///电影图片
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                fadeInDuration: Duration(milliseconds: 0),
                width: 150,
                height: 180,
                imageUrl: _hotShowSubjectData[index].images.medium,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),

          ///电影文字
          Container(
            margin: EdgeInsets.only(top: 5),
            alignment: Alignment.topLeft,
            child: Text(
              _hotShowSubjectData[index].title,
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: ScreenUtil().setSp(26),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                child: FlutterRatingBarIndicator(
                  itemPadding: EdgeInsets.all(0),
                  rating: (_hotShowSubjectData[index].rating.average /
                          _hotShowSubjectData[index].rating.max) *
                      5,
                  itemCount: 5,
                  itemSize: 10.0,
                  emptyColor: Colors.black.withAlpha(50),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                child: Text(
                  (_hotShowSubjectData[index].rating.average.toString()),
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(22),
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  ///即将上映的网格item
  Widget _comingSoonMovieGridItem(int index) {
    return GestureDetector(
      onTap: () {
        NavigatorUtil.push(
            context,
            MovieDetailPage(
              movieId: _comingSoonSubjectData[index].id,
              isComingSoon: true,
            ),
            rootNavigator: true);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                fadeInDuration: Duration(milliseconds: 0),
                width: 150,
                height: 180,
                imageUrl: _comingSoonSubjectData[index].images.medium,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            alignment: Alignment.topLeft,
            child: Text(
              _comingSoonSubjectData[index].title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(26),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 4),
            child: Text(
              '${_comingSoonSubjectData[index].collectCount}人想看',
              style: TextStyle(fontSize: ScreenUtil().setSp(21)),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
            decoration: Decorations.movieGridPubDataDecoration,
            child: Text(
              _comingSoonSubjectData[index].pubdates[0].substring(5, 10) + "日",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(18),
                  color: Colors.red,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  ///在数据加载的时候用的骨架布局
  Widget _skeletonGridItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            width: 150,
            height: 180,
            color: Constants.APP_SKELETON_COLOR,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Constants.APP_SKELETON_COLOR,
          ),
          height: 8,
          width: 70,
          margin: EdgeInsets.only(top: 5, bottom: 5),
        ),
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Constants.APP_SKELETON_COLOR,
              ),
              height: 6,
              width: 50,
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Constants.APP_SKELETON_COLOR,
              ),
              height: 6,
              width: 30,
            )
          ],
        ),
      ],
    );
  }
}
