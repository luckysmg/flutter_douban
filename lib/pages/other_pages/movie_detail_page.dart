import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/entity/movie_detail_entity.dart';
import 'package:flutter_douban/entity/movie_long_comment_entity.dart';
import 'package:flutter_douban/model/movie_detail_model.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_douban/util/toast_util.dart';
import 'package:flutter_douban/widgets/common_widgets/empty_movie_detail_view.dart';
import 'package:flutter_douban/widgets/movie_widgets/brief_introduction_view.dart';
import 'package:flutter_douban/widgets/movie_widgets/buy_ticket_view.dart';
import 'package:flutter_douban/widgets/movie_widgets/movie_detail_drawer.dart';
import 'package:flutter_douban/widgets/movie_widgets/movie_score_footer.dart';
import 'package:flutter_douban/widgets/movie_widgets/movie_score_header.dart';
import 'package:flutter_douban/widgets/movie_widgets/movie_short_comment_view.dart';
import 'package:flutter_douban/widgets/movie_widgets/performing_people_view.dart';
import 'package:flutter_douban/widgets/movie_widgets/record_card_view.dart';
import 'package:flutter_douban/widgets/movie_widgets/score_star_detail.dart';
import 'package:flutter_douban/widgets/movie_widgets/trailers_photo_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

///
/// @created by 文景睿
/// description:电影详情页(利用状态管理完成，而非用StatefulWidget,此页面布局较为复杂）
///
// ignore: must_be_immutable
class MovieDetailPage extends StatelessWidget {
  final String movieId;
  final Color _textColor = Colors.white;
  final Color _bgColor = Colors.blueGrey[600];
  final ScrollController _controller = new ScrollController();

  ///电影详情数据实体
  MovieDetailEntity _detailData;

  ///电影长评数据实体（用于抽屉中）
  MovieLongCommentEntity _longCommentData;
  BuildContext context;

  MovieDetailPage({Key key, this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {});

    return ChangeNotifierProvider(
      builder: (context) => MovieDetailModel(movieId: this.movieId),
      child: Consumer<MovieDetailModel>(
        builder: (context, value, child) {
          ///builder方法会在model中 notifyListener被调用的时候重复调用一次，而在数据到来之前我们使用的是空布局，所以在主体布局里面
          ///我们拿到的context和data一定不为空
          _detailData = value.detailData;
          _longCommentData = value.longCommentData;
          this.context = context;

          return value.hasData
              ? _filledDataView(context)
              : EmptyMovieDetailView();
        },
      ),
    );
  }

  ///已经有数据的主体布局
  Widget _filledDataView(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(
        backgroundColor: _bgColor,
        elevation: 0.0,
        title: Text(
          '电影',
          style: TextStyle(fontSize: ScreenUtil().setSp(35)),
        ),
        centerTitle: true,
        leading: _backIcon(context),
        actions: <Widget>[_moreIcon()],
      ),
      body: Stack(
        children: <Widget>[
          _mainBody(),
          MovieDetailDrawer(
            longCommentData: _longCommentData,
          ),
        ],
      ),
    );
  }

  ///返回键
  Widget _backIcon(context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 50,
        width: 50,
        child: Icon(Icons.arrow_back_ios),
      ),
    );
  }

  ///appbar右边的'更多'按钮
  Widget _moreIcon() {
    return Container(
        margin: EdgeInsets.only(right: 10), child: Icon(Icons.more_horiz));
  }

  ///主体布局（除开抽屉的布局）
  Widget _mainBody() {
    return Container(
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          controller: _controller,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            _movieDetailHeader(),
            RecordCardView(),
            _scoreCard(),
            BuyTicketView(),
            BriefIntroductionView(text: _detailData.summary),
            PerformingPeopleView(
              dataList: _detailData.casts,
            ),
            TrailersPhotoView(
              data: _detailData,
            ),
            MovieShortCommentView(data: _detailData),
            _placeHolder(),
          ],
        ),
      ),
    );
  }

  ///电影详情页面最上方的头布局
  Widget _movieDetailHeader() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: ScreenUtil().setHeight(250),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _movieImage(),
          _movieInfo(),
        ],
      ),
    );
  }

  ///电影图片
  Widget _movieImage() {
    return Container(
      margin: EdgeInsets.only(right: 20),
      height: ScreenUtil().setHeight(250),
      width: ScreenUtil().setWidth(200),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          imageUrl: _detailData.images.large,
          fadeInDuration: Duration(milliseconds: 100),
        ),
      ),
    );
  }

  ///电影图片右边的描述布局
  Widget _movieInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ///电影名字 eg:上海堡垒
        Container(
          margin: EdgeInsets.only(top: 5, bottom: 5),
          width: ScreenUtil().setWidth(340),
          child: Text(
            _detailData.title,
            style: TextStyle(
                fontSize: ScreenUtil().setSp(40),
                fontWeight: FontWeight.w700,
                color: _textColor),
          ),
        ),

        ///电影年份 eg:2019
        Container(
          width: ScreenUtil().setWidth(340),
          child: Text(
            '(${_detailData.year})',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(30),
                fontWeight: FontWeight.w700,
                color: _textColor),
          ),
        ),

        ///电影描述eg:中国大陆/爱情战争科幻/上映时间....
        Container(
          margin: EdgeInsets.only(top: 10),
          width: ScreenUtil().setWidth(450),
          child: Text(
            '${_detailData.countries[0]} / ${Provider.of<MovieDetailModel>(context).getTypes()}'
            ' / 上映时间:${_detailData.pubdates[0]} / 片长:${_detailData.durations[0]}',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(20),
                color: _textColor,
                fontWeight: FontWeight.w500),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        ///想看，爱看两个按钮
        _twoButtons(),
      ],
    );
  }

  ///想看，爱看两个按钮布局
  Widget _twoButtons() {
    return Expanded(
      child: Container(
        width: ScreenUtil().setWidth(460),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            _contentInTwoButton('ic_info_wish.png', '想看'),
            SizedBox(
              width: ScreenUtil().setWidth(20),
            ),
            _contentInTwoButton('ic_info_done.png', '看过')
          ],
        ),
      ),
    );
  }

  ///想看，爱看两个按钮里面图片和文字
  Widget _contentInTwoButton(String assetName, String text) {
    return Expanded(
      child: CupertinoButton(
        color: Colors.white,
        minSize: 35,
        padding: EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          height: ScreenUtil().setHeight(30),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  Constants.ASSETS_IMG + assetName,
                  height: ScreenUtil().setHeight(30),
                ),
                SizedBox(width: 3),
                Text(
                  text,
                  style: TextStyle(
                      color: Colors.black, fontSize: ScreenUtil().setSp(30)),
                ),
              ],
            ),
          ),
        ),
        onPressed: () {
          ToastUtil.show('知道了，你$text');
        },
        pressedOpacity: 0.3,
      ),
    );
  }

  ///豆瓣评分的card
  Widget _scoreCard() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
      height: ScreenUtil().setHeight(210),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color.fromARGB(120, 0, 0, 0),
      ),
      child: Column(
        children: <Widget>[
          MovieScoreHeader(),
          ScoreStarDetail(
            rating: _detailData.rating,
          ),
          _divider(),
          MovieScoreFooter(
            lookedCount: _detailData.collectCount,
            wishCount: _detailData.wishCount,
          ),
        ],
      ),
    );
  }

  ///分割线
  Widget _divider() {
    return Container(
      width: ScreenUtil().setWidth(650),
      height: 1,
      margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
      color: Colors.white12,
    );
  }

  ///下方占位布局，是为了配合下方的抽屉布局
  Widget _placeHolder() {
    return SizedBox(
      height: ScreenUtil().setHeight(120),
    );
  }
}