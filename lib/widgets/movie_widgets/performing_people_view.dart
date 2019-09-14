import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/entity/movie_detail_entity.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

///
/// @created by 文景睿
/// description:电影详情中的演职员布局
///
class PerformingPeopleView extends StatelessWidget {
  final List<MovieDetailCast> dataList;

  const PerformingPeopleView({Key key, this.dataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        child: Column(
          children: <Widget>[_header(), _photoList(context)],
        ),
      ),
    );
  }

  ///布局头
  Widget _header() {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10, right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
              child: Container(
            child: Text(
              '演职员',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(35),
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              '全部 10 >',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(21), color: Colors.white54),
            ),
          ),
        ],
      ),
    );
  }

  ///演职员照片
  Widget _photoList(context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 200),
      child: EasyRefresh(
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            return _photoListItem(index);
          },
        ),
      ),
    );
  }

  ///照片的单个item
  Widget _photoListItem(index) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[_photo(index), _name(index), _station(index)],
      ),
    );
  }

  ///照片
  Widget _photo(index) {
    return Container(
      margin: EdgeInsets.only(right: 10, top: 10, bottom: 5),
      height: ScreenUtil().setHeight(200),
      width: ScreenUtil().setWidth(160),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: dataList[index].avatars.small,
          fadeInDuration: Duration(milliseconds: 100),
        ),
      ),
    );
  }

  ///名字
  Widget _name(index) {
    return Container(
      child: Text(
        dataList[index].name,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: ScreenUtil().setSp(24)),
      ),
    );
  }

  ///职位
  Widget _station(index) {
    return Container(
      margin: EdgeInsets.only(top: 2),
      child: Text(
        dataList[index].nameEn,
        style: TextStyle(
            fontSize: ScreenUtil().setSp(18), color: Colors.grey[200]),
      ),
    );
  }
}
