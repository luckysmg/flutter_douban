import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/entity/movie_detail_entity.dart';
import 'package:flutter_douban/entity/movie_long_comment_entity.dart';
import 'package:flutter_douban/model/movie_detail_model.dart';
import 'package:flutter_douban/test.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_douban/util/navigatior_util.dart';
import 'package:flutter_douban/util/toast_util.dart';
import 'package:flutter_douban/widgets/common_widgets/bottom_draggable_drawer.dart';
import 'package:flutter_douban/widgets/common_widgets/skeleton_view_with_nav_bar.dart';
import 'package:flutter_douban/widgets/movie_widgets/brief_introduction_view.dart';
import 'package:flutter_douban/widgets/movie_widgets/buy_ticket_view.dart';
import 'package:flutter_douban/widgets/movie_widgets/movie_detail_appbar_indicator.dart';
import 'package:flutter_douban/widgets/movie_widgets/movie_detail_appbar_title.dart';
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
/// description:电影详情页(利用状态管理完成,此页面布局较为复杂）
///
class MovieDetailPage extends StatefulWidget {
  final String movieId;
  final bool isComingSoon;

  ///appbar交互的判断临界offset
  static const edgeOffsetY = 200.0;

  MovieDetailPage({Key key, this.movieId, this.isComingSoon = false})
      : super(key: key);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final BottomDraggableDrawerController controller =
      BottomDraggableDrawerController();

  final Color _textColor = Colors.white;

  Color _bgColor = Colors.blueGrey[600];

  final ScrollController scrollController = ScrollController();

  final MovieDetailModel _movieDetailModel = MovieDetailModel();

  final GlobalKey<MovieDetailAppbarIndicatorState> appbarIndicatorKey =
      GlobalKey();
  final GlobalKey<MovieDetailAppbarTitleState> appbarTitleKey = GlobalKey();

  ///电影详情数据实体
  MovieDetailEntity _detailData;

  ///电影长评数据实体（用于抽屉中）
  MovieLongCommentEntity _longCommentData;

  ///整个页面的context
  BuildContext context;

  ///下面这两个是控制刷新范围的
  BuildContext appBarTitleContext;
  BuildContext appBarIndicatorContext;

  ///appbar上退出按钮右边的电影指示的初始化透明度
  var indicatorOpacity = 0.0;

  ///appbar上标题的初始化透明度
  var titleOpacity = 1.0;

  ///indicator的Y方向偏移
  var indicatorOffsetY;

  @override
  void initState() {
    super.initState();
    _movieDetailModel.init(
        movieId: widget.movieId, isComingSoon: widget.isComingSoon);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => _movieDetailModel,
      child: Consumer<MovieDetailModel>(
        builder: (context, value, child) {
          _detailData = value.detailData;
          _longCommentData = value.longCommentData;
          _bgColor = value.bgColor;
          this.context = context;
          return value.hasData
              ? _filledDataView(context)
              : SkeletonViewWithNavBar();
        },
      ),
    );
  }

  ///已经有数据的主体布局
  Widget _filledDataView(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: _appBar(context),
      body: Stack(
        children: <Widget>[
          _mainBody(),
          MovieDetailDrawer(
            controller: controller,
            longCommentData: _longCommentData,
            isComingSoon: widget.isComingSoon,
          ),
        ],
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return CupertinoNavigationBar(
      transitionBetweenRoutes: false,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: ScreenUtil().setHeight(30),
          color: Colors.white70,
        ),
      ),
      backgroundColor: Colors.transparent,
      trailing: _moreIcon(),
      actionsForegroundColor: Colors.white,
      middle: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _scrollToTop,
        child: Container(
          child: Stack(
            children: <Widget>[
              _movieDetailAppbarTitle(),
              _movieAppBarIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _movieAppBarIndicator() {
    return MovieDetailAppbarIndicator(
      key: appbarIndicatorKey,
      data: _detailData,
    );
  }

  Widget _movieDetailAppbarTitle() {
    return Container(
      alignment: Alignment.center,
      child: MovieDetailAppbarTitle(
        key: appbarTitleKey,
      ),
    );
  }

  ///appbar右边的'更多'按钮
  Widget _moreIcon() {
    return GestureDetector(
      onTap: () {
        controller.switchDrawerStatus();
//        NavigatorUtil.push(context, MainPage());
      },
      child: Container(
        margin: EdgeInsets.only(right: ScreenUtil().setWidth(15)),
        child: Icon(
          Icons.more_horiz,
          size: ScreenUtil().setHeight(40),
        ),
      ),
    );
  }

  ///主体布局（除开抽屉的布局）
  Widget _mainBody() {
    ///这里添加刷新布局是因为需要回弹效果，flutter自带的回弹效果有动画bug
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: CustomScrollView(
        controller: scrollController..addListener(scrollEffect),
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          _movieDetailHeader(),
          RecordCardView(),
          _scoreCard(),
          BuyTicketView(),
          BriefIntroductionView(text: _detailData.summary),
          PerformingPeopleView(dataList: _detailData.casts),
          TrailersPhotoView(data: _detailData),
          MovieShortCommentView(data: _detailData),
          _placeHolder(),
        ],
      ),
    );
  }

  ///电影详情页面最上方的头布局
  Widget _movieDetailHeader() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
        height: ScreenUtil().setHeight(250),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _movieImage(),
            _movieInfo(),
          ],
        ),
      ),
    );
  }

  ///电影图片
  Widget _movieImage() {
    return Container(
      margin: EdgeInsets.only(right: ScreenUtil().setWidth(28)),
      width: ScreenUtil().setWidth(220),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
          imageUrl: _detailData.images.large,
          fadeInDuration: Duration(milliseconds: 100),
        ),
      ),
    );
  }

  ///电影图片右边的描述布局
  Widget _movieInfo() {
    var duration;
    if (_detailData.durations.length != 0) {
      duration = '片长${_detailData.durations[0]}';
    } else {
      duration = '';
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ///电影名字 eg:上海堡垒
        Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5),
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
          margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
          width: ScreenUtil().setWidth(450),
          child: Text(
            '${_detailData.countries[0]} / ${Provider.of<MovieDetailModel>(context).getTypes()}'
            ' / 上映时间:${_detailData.pubdates[0]} / $duration',
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
        minSize: ScreenUtil().setHeight(40),
        padding: EdgeInsets.all(ScreenUtil().setHeight(8)),
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
        pressedOpacity: 0.2,
      ),
    );
  }

  ///豆瓣评分的card
  Widget _scoreCard() {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
        height: widget.isComingSoon
            ? ScreenUtil().setHeight(180)
            : ScreenUtil().setHeight(210),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromARGB(120, 0, 0, 0),
        ),
        child: Column(
          children: <Widget>[
            MovieScoreHeader(),
            widget.isComingSoon || _detailData.rating.average == 0
                ? _emptyScoreDetail()
                : ScoreStarDetail(
                    rating: _detailData.rating,
                  ),
            widget.isComingSoon ? Container() : _divider(),
            widget.isComingSoon
                ? Container()
                : MovieScoreFooter(
                    lookedCount: _detailData.collectCount,
                    wishCount: _detailData.wishCount,
                  ),
          ],
        ),
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

  ///即将上映的条目所使用的空的评分板
  Widget _emptyScoreDetail() {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(120),
              top: ScreenUtil().setHeight(40),
            ),
            child: Text('暂无评分', style: TextStyle(color: Colors.white70)),
          ),
          Container(
            margin: EdgeInsets.only(
                top: ScreenUtil().setHeight(40),
                left: ScreenUtil().setWidth(220)),
            child: Text('${_detailData.wishCount}人想看',
                style: TextStyle(color: Colors.white70)),
          ),
        ],
      ),
    );
  }

  ///下方占位布局，是为了配合下方的抽屉布局
  Widget _placeHolder() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: ScreenUtil().setHeight(120),
      ),
    );
  }

  ///滚动监听动画交互
  void scrollEffect() {
    double offset = scrollController.offset;
    if (offset < 0) {
      offset = 0;
    } else if (offset > MovieDetailPage.edgeOffsetY) {
      offset = MovieDetailPage.edgeOffsetY;
    }

    ///这里用数学知识就可以算出来的交互效果
    indicatorOpacity = offset / MovieDetailPage.edgeOffsetY;
    titleOpacity =
        (MovieDetailPage.edgeOffsetY - offset) / MovieDetailPage.edgeOffsetY;
    double indicatorOffsetY = -(1 / 5) * offset + 40;

    appbarIndicatorKey.currentState.update(indicatorOpacity, indicatorOffsetY);
    appbarTitleKey.currentState.update(titleOpacity);
  }

  ///滚动到顶部
  void _scrollToTop() {
    if (scrollController.offset != 0) {
      scrollController.animateTo(0,
          duration: Duration(milliseconds: 300), curve: Curves.decelerate);
    }
  }
}
