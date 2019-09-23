import 'package:flutter_douban/entity/comment_entity.dart';
import 'package:flutter_douban/entity/kou_bei_entity.dart';
import 'package:flutter_douban/entity/celebrity_works_entity.dart';
import 'package:flutter_douban/entity/movie_long_comment_entity.dart';
import 'package:flutter_douban/entity/movie_detail_entity.dart';
import 'package:flutter_douban/entity/movie_bottom_list_entity.dart';
import 'package:flutter_douban/entity/celebrity_entity.dart';
import 'package:flutter_douban/entity/coming_soon_entity.dart';
import 'package:flutter_douban/entity/hot_show_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "CommentEntity") {
      return CommentEntity.fromJson(json) as T;
    } else if (T.toString() == "KouBeiEntity") {
      return KouBeiEntity.fromJson(json) as T;
    } else if (T.toString() == "CelebrityWorksEntity") {
      return CelebrityWorksEntity.fromJson(json) as T;
    } else if (T.toString() == "MovieLongCommentEntity") {
      return MovieLongCommentEntity.fromJson(json) as T;
    } else if (T.toString() == "MovieDetailEntity") {
      return MovieDetailEntity.fromJson(json) as T;
    } else if (T.toString() == "MovieBottomListEntity") {
      return MovieBottomListEntity.fromJson(json) as T;
    } else if (T.toString() == "CelebrityEntity") {
      return CelebrityEntity.fromJson(json) as T;
    } else if (T.toString() == "ComingSoonEntity") {
      return ComingSoonEntity.fromJson(json) as T;
    } else if (T.toString() == "HotShowEntity") {
      return HotShowEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}