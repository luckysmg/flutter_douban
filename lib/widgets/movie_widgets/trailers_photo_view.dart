import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/entity/movie_detail_entity.dart';
import 'package:flutter_douban/pages/book_music_pages/movie_video_player_page.dart';
import 'package:flutter_douban/routes/custom_routes.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///
/// @created by 文景睿
/// description:电影详情中预告片，视频评论，剧照的横向滚动布局
///
class TrailersPhotoView extends StatelessWidget {
  final MovieDetailEntity data;

  const TrailersPhotoView({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        child: Column(
          children: <Widget>[
            _header(),
            _horizontalList(context),
          ],
        ),
      ),
    );
  }

  ///头布局
  Widget _header() {
    return Container(
      child: Row(
        children: <Widget>[
          _leftText(),
          _rightButton(),
        ],
      ),
    );
  }

  ///header上靠左边的文字
  Widget _leftText() {
    return Expanded(
        child: Container(
      child: Text(
        '预告片 / 视频评论 / 剧照',
        style: TextStyle(
          fontSize: ScreenUtil().setSp(35),
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ));
  }

  ///header上靠右边的'全部'按钮
  Widget _rightButton() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        '全部 190 >',
        style:
            TextStyle(fontSize: ScreenUtil().setSp(21), color: Colors.white54),
      ),
    );
  }

  ///展示预告片，剧照等的水平布局
  Widget _horizontalList(BuildContext context) {
    ///这个是控制视频播放的状态控制model，因为这个节点是其视频页面的和进度条控制器的共同父节点，所以放在这里
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: ScreenUtil().setHeight(200),
      child: EasyRefresh(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 2 + data.photos.length,
          itemBuilder: (context, index) {
            if (index == 0 || index == 1) {
              return _videoTypeView(context, index);
            } else {
              return _photoView(index);
            }
          },
        ),
      ),
    );
  }

  ///带预告片的类型item
  Widget _videoTypeView(context, index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          GradualChangePageRoute(
            MovieVideoPlayerPage(data: data, dataIndex: index),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 4),
        child: Stack(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: data.trailers[index].medium,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(left: ScreenUtil().setWidth(180)),
                child: Icon(
                  Icons.play_circle_outline,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.amber[600],
                  borderRadius: BorderRadius.circular(4),
                ),
                margin: EdgeInsets.only(top: 3, left: 3),
                child: Text(
                  '预告片',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(21),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///剧照类型item
  Widget _photoView(index) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      child: CachedNetworkImage(
        imageUrl: data.photos[index - 2].image,
        fadeInDuration: Duration(milliseconds: 200),
      ),
    );
  }
}
