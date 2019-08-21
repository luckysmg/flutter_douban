import 'package:flutter_douban/entity/movie_detail_entity.dart';
import 'package:flutter_douban/entity/movie_long_comment_entity.dart';
import 'package:flutter_douban/http/mock_request.dart';

import '../entity_factory.dart';
import 'base_model.dart';

///
/// @created by 文景睿
/// description:电影详情数据管理model
///
class MovieDetailModel extends BaseModel {
  MovieDetailEntity _detailData;
  MovieLongCommentEntity _longCommentData;
  String movieId;

  MovieDetailEntity get detailData => _detailData;

  MovieLongCommentEntity get longCommentData => _longCommentData;

  MovieDetailModel({this.movieId}) {
    ///构造函数传入id之后就开始请求模拟数据
    getMovieDetailData().then((data) {
      _detailData = data;
    }).whenComplete(() {
      getMovieLongCommentData().then((data) async {
        _longCommentData = data;
        hasData = true;

        ///模拟请求网络的延迟
        await Future.delayed(Duration(milliseconds: 800));
        notifyListeners();
      });
    });
  }

  Future<MovieDetailEntity> getMovieDetailData() async {
    MovieDetailEntity entity;
    await MockRequest.mock('wander_earth').then((data) {
      entity = EntityFactory.generateOBJ(data);
    });

    return entity;
  }

  Future<MovieLongCommentEntity> getMovieLongCommentData() async {
    MovieLongCommentEntity entity;

    await MockRequest.mock('movie_long_comments').then((data) {
      entity = EntityFactory.generateOBJ(data);
    });

    return entity;
  }

  ///获取电影的分类字符串
  String getTypes() {
    String temp = '';
    for (int i = 0; i < _detailData.genres.length; i++) {
      temp = temp + ' ' + _detailData.genres[i];
    }
    return temp;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
