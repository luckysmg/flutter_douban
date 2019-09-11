import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/entity/hot_show_entity.dart';
import 'package:flutter_douban/entity_factory.dart';
import 'package:flutter_douban/http/mock_request.dart';
import 'package:flutter_douban/pages/other_pages/movie_detail_page.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_douban/util/navigatior_util.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// @created by 文景睿
/// description:豆瓣热门的网格布局
///
class HotMovieGrid extends StatefulWidget {
  HotMovieGrid({Key key}) : super(key: key);

  @override
  HotMovieGridState createState() => HotMovieGridState();
}

class HotMovieGridState extends State<HotMovieGrid>
    with AutomaticKeepAliveClientMixin {
  ///保存状态
  @override
  bool get wantKeepAlive => true;

  HotShowEntity _hotShowEntity;
  List<HotShowSubject> _hotShowSubjectData;
  bool hasData = false;

  ///有无数据的标示

  @override
  void initState() {
    super.initState();
    _requestData();
  }

  ///请求模拟json数据
  Future _requestData() async {
    Timer(Duration(milliseconds: 300), () async {
      await MockRequest.mock(Constants.URL_IN_THEATERS).then((data) {
        _hotShowEntity = EntityFactory.generateOBJ(data);
        _hotShowSubjectData = _hotShowEntity.subjects;
        removeSomeData();
        hasData = true;
      }).whenComplete(() {
        setState(() {});
      });
    });
  }

  ///刷新数据
  Future refreshData() async {
    hasData = false;
    _hotShowSubjectData = null;
    _requestData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: <Widget>[
        _bar(),
        _movieGrid(hasData),
      ],
    );
  }

  Widget _bar() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(24),
                ScreenUtil().setHeight(18), 0, ScreenUtil().setHeight(18)),
            child: Text(
              '豆瓣热门',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(34),
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Container(
            margin: EdgeInsets.only(right: 10),
            child: Text(
              _hotShowSubjectData == null
                  ? '全部'
                  : '全部 ${_hotShowSubjectData.length} >',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(21),
                fontWeight: FontWeight.w500,
              ),
            )),
      ],
    );
  }

  Widget _movieGrid(bool hasData) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 5),
      child: GridView.builder(
          padding: EdgeInsets.only(top: 0),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.49,
          ),
          itemBuilder: (context, index) {
            ///若没有数据直接返回骨架布局
            if (!hasData) {
              return _skeletonGridItem();
            } else {
              ///若有数据，根据tab的高亮状态来判定显示哪个布局的item，因为两个item的有些布局属性不一样
              return _movieGridItem(index);
            }
          }),
    );
  }

  ///影院热映的网格item
  Widget _movieGridItem(int index) {
    return GestureDetector(
      onTap: () {
        NavigatorUtil.push(
            context,
            MovieDetailPage(
              movieId: _hotShowSubjectData[index].id,
            ),
            rootNavigator: true);
      },
      child: Column(
        children: <Widget>[
          ///电影图片
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
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
                fontSize: ScreenUtil().setSp(26),
                fontWeight: FontWeight.bold,
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
                  ((_hotShowSubjectData[index].rating.average /
                              _hotShowSubjectData[index].rating.max) *
                          5)
                      .toString(),
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(21),
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
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

  ///这里为了让它和上面数据不一样象征性的移除几个元素，没有任何用处
  void removeSomeData() {
    for (int i = 0; i < 8; i++) {
      _hotShowSubjectData.removeAt(0);
    }
  }
}
