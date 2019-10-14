import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/src/rendering/sliver.dart';
import 'package:flutter_douban/entity/comment_entity.dart';
import 'package:flutter_douban/entity/movie_bottom_list_entity.dart';
import 'package:flutter_douban/entity/top250_entity.dart';
import 'package:flutter_douban/http/dio_util.dart';
import 'package:flutter_douban/http/mock_request.dart';
import 'package:flutter_douban/pages/other_pages/movie_detail_page.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_douban/util/navigatior_util.dart';
import 'package:flutter_douban/widgets/common_widgets/rating_bar_indicator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:video_player/video_player.dart';

import '../../entity_factory.dart';

///
/// @created by 文景睿
/// description:书影音页面最下面的电影listView,由于没有数据，设计样式和实际的app有点差异
///

class MovieStaggeredList extends StatefulWidget {
  @override
  _MovieStaggeredListState createState() => _MovieStaggeredListState();
}

class _MovieStaggeredListState extends State<MovieStaggeredList> {
  Top250Entity data;

  @override
  void initState() {
    super.initState();
    requestData();
  }

  void requestData() async {
    if (Constants.isRealNetworkData) {
      await DioUtil.getInstance()
          .get(
        url: Constants.URL_REAL_TOP250,
      )
          .then((data) {
        this.data = Top250Entity.fromJson(data);
      });
    } else {
      await MockRequest.mock('current_top250').then((data) {
        this.data = Top250Entity.fromJson(data);
      });
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return SliverToBoxAdapter(
          child: Container(
        height: 100,
      ));
    }
    return SliverToBoxAdapter(
      child: StaggeredGridView.countBuilder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 4,
        itemCount: data.subjects.length,
        itemBuilder: (context, index) {
          return _item(context, index);
        },
        staggeredTileBuilder: (index) => StaggeredTile.fit(2),
      ),
    );
  }

  Widget _item(BuildContext context, int index) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        NavigatorUtil.push(
            context,
            MovieDetailPage(
              movieId: data.subjects[index].id,
              isComingSoon: false,
            ),
            rootNavigator: true);
      },
      child: Container(
        margin: EdgeInsets.all(ScreenUtil().setHeight(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _itemImage(index),
            _itemText(index),
            _itemScore(index),
            _itemCollectCount(index),
          ],
        ),
      ),
    );
  }

  Widget _itemImage(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(ScreenUtil().setHeight(10)),
      child: CachedNetworkImage(
        imageUrl: data.subjects[index].images.small,
        placeholder: (context, string) {
          return Container(
            height: ScreenUtil().setHeight(420),
          );
        },
      ),
    );
  }

  Widget _itemText(int index) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(12)),
      child: Text(
        data.subjects[index].title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: ScreenUtil().setSp(30),
        ),
      ),
    );
  }

  Widget _itemScore(int index) {
    return Container(
      child: Row(
        children: <Widget>[
          FlutterRatingBarIndicator(
            rating: data.subjects[index].rating.average / 2,
            itemSize: ScreenUtil().setHeight(20),
            itemPadding: EdgeInsets.only(right: ScreenUtil().setWidth(2)),
          ),
          Container(
            margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
            child: Text(data.subjects[index].rating.average.toString()),
          ),
        ],
      ),
    );
  }

  Widget _itemCollectCount(int index) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(6)),
      child: Text(
        '${data.subjects[index].collectCount} 看过',
        style: TextStyle(
            fontSize: ScreenUtil().setSp(24), fontWeight: FontWeight.w500),
      ),
    );
  }
}
