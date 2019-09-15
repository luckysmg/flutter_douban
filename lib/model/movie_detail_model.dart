import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_douban/entity/movie_detail_entity.dart';
import 'package:flutter_douban/entity/movie_long_comment_entity.dart';
import 'package:flutter_douban/http/dio_util.dart';
import 'package:flutter_douban/http/mock_request.dart';
import 'package:flutter_douban/util/constants.dart';
import 'package:flutter_douban/util/palette_generator.dart';

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
  bool isComingSoon = false;

  Color _bgColor = Colors.blueGrey[600];

  Color get bgColor => _bgColor;

  MovieDetailEntity get detailData => _detailData;

  MovieLongCommentEntity get longCommentData => _longCommentData;

  @override
  void init({movieId, isComingSoon}) async {
    this.movieId = movieId;
    this.isComingSoon = isComingSoon;
    if (Constants.isRealNetworkData) {
      _requestHttpData(isComingSoon);
    } else {
      _requestMockData();
    }
  }

  ///请求模拟数据
  void _requestMockData() async {
    await getMovieDetailData().then((data) {
      _detailData = data;
    });

    await getMovieLongCommentData().then((data) {
      _longCommentData = data;
    });

    await Future.delayed(Duration(milliseconds: 800));
    hasData = true;
    notifyListeners();
  }

  ///请求真实数据
  void _requestHttpData(bool isComingSoon) async {
    ///获取电影基本条目信息
    await DioUtil.getInstance()
        .get(url: '/v2/movie/subject/$movieId?apikey=${Constants.API_KEY}')
        .then((data) {
      _detailData = MovieDetailEntity.fromJson(data);
    });

    if (!isComingSoon) {
      ///获取抽屉中的评论数据
      await DioUtil.getInstance()
          .get(
              url:
                  '/v2/movie/subject/$movieId/reviews?apikey=${Constants.API_KEY}')
          .then((data) {
        _longCommentData = MovieLongCommentEntity.fromJson(data);
      });
    }

    await PaletteGenerator.fromImageProvider(
            NetworkImage(_detailData.images.large))
        .then((paletteGenerator) {
      if (paletteGenerator != null && paletteGenerator.colors.isNotEmpty) {
        _bgColor = paletteGenerator.colors.toList()[0];
      }
    });
    hasData = true;
    notifyListeners();
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
}
