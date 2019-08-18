import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_douban/entity/comment_entity.dart';
import 'package:flutter_douban/entity/movie_bottom_list_entity.dart';
import 'package:flutter_douban/http/mock_request.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../entity_factory.dart';

///
/// @created by 文景睿
/// description:书影音页面最下面的电影listView,由于没有数据，设计样式和实际的app有点差异
///

class MovieBottomList extends StatefulWidget {
  @override
  _MovieBottomListState createState() => _MovieBottomListState();
}

class _MovieBottomListState extends State<MovieBottomList> {
  MovieBottomListEntity _data;
  List<MovieBottomListSubject> _dataList;

  CommentEntity _commentData;
  List<CommantCommants> _commentList;

  @override
  void initState() {
    super.initState();
    _requestInfo();
  }

  ///请求模拟数据(这里由于找不到数据了，就请求top250的和评论的吧，反正就是随便看看效果）
  Future _requestInfo() async {
    await MockRequest.mock(Constants.URL_TOP250).then((data) {
      _data = EntityFactory.generateOBJ(data);
      _dataList = _data.subjects;
    });
    await MockRequest.mock(Constants.URL_COMMENT).then((data) {
      _commentData = EntityFactory.generateOBJ(data);
      _commentList = _commentData.comments;
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _dataList == null
        ? _emptyView()
        : ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _dataList.length,
            itemBuilder: (context, index) {
              return _item(index);
            });
  }

  ///随便做一个空的占位布局吧
  Widget _emptyView() {
    return Container();
  }

  Widget _item(index) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _images(index),
          _movieName(index),
          _stars(index),
          _content(index),
        ],
      ),
    );
  }

  Widget _images(index) {
    return Row(
      children: <Widget>[
        _imageItem(_dataList[index].images.medium),
        _imageItem(_dataList[index].casts[0].avatars.large),
        _imageItem(_dataList[index].casts[1].avatars.large),
        _imageItem(_dataList[index].casts[2].avatars.large),
      ],
    );
  }

  Widget _imageItem(String url) {
    return Expanded(
      child: Container(
        height: 110,
        margin: EdgeInsets.only(left: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CachedNetworkImage(
            imageUrl: url,
          ),
        ),
      ),
    );
  }

  Widget _movieName(index) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 15),
      child: Text(
        _dataList[index].title + ' (${_dataList[index].year})',
        style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: ScreenUtil().setSp(32)),
      ),
    );
  }

  Widget _stars(index) {
    var num =
        5 * (_dataList[index].rating.average / _dataList[index].rating.max);
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Row(
        children: <Widget>[
          FlutterRatingBarIndicator(
            itemPadding: EdgeInsets.all(0),
            rating: num,
            itemCount: 5,
            itemSize: 10.0,
            emptyColor: Colors.black.withAlpha(50),
          ),
          Container(
            child: Text(
              num.toString(),
              style: TextStyle(fontSize: ScreenUtil().setSp(24)),
            ),
            margin: EdgeInsets.only(left: 10),
          ),
        ],
      ),
    );
  }

  ///内容（由于没有内容，这里就用其他地方有内容的BEAN随便充当一下评论效果，这个肯定是和电影条目不匹配的）
  Widget _content(index) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 30),
      child: Text(
        _commentList[index].content,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black38,
            fontSize: ScreenUtil().setSp(24)),
      ),
    );
  }
}
