import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_douban/entity/celebrity_entity.dart';
import 'package:flutter_douban/entity/celebrity_works_entity.dart';
import 'package:flutter_douban/pages/other_pages/celebrity_page/celebrity_brief_introduction/state.dart';
import 'package:flutter_douban/pages/other_pages/celebrity_page/celebrity_header_component/state.dart';
import 'package:flutter_douban/pages/other_pages/celebrity_page/celebrity_movies_component/state.dart';
import 'package:flutter_douban/pages/other_pages/celebrity_page/celebrity_photos/state.dart';

class CelebrityState implements Cloneable<CelebrityState> {
  String id;
  CelebrityEntity celebrityData;
  CelebrityWorksEntity celebrityWorksData;

  @override
  CelebrityState clone() {
    return CelebrityState()
      ..id = id
      ..celebrityData = celebrityData
      ..celebrityWorksData = celebrityWorksData;
  }
}

CelebrityState initState(Map<String, dynamic> args) {
  String id = args['id'];
  return CelebrityState()..id = id;
}

///影人的照片+名字的listView的最上面组件的连接器
class CelebrityHeaderConnector
    extends ConnOp<CelebrityState, CelebrityHeaderState> {
  @override
  CelebrityHeaderState get(CelebrityState state) {
    final CelebrityHeaderState subState = CelebrityHeaderState();
    subState.photoUrl = state.celebrityData.avatars.small;
    subState.name = state.celebrityData.name;
    subState.nameEn = state.celebrityData.nameEn;

    return subState;
  }

  @override
  void set(CelebrityState state, CelebrityHeaderState subState) {}
}

///简介连接器
class CelebrityBriefIntroductionConnector
    extends ConnOp<CelebrityState, CelebrityBriefIntroductionState> {
  @override
  CelebrityBriefIntroductionState get(CelebrityState state) {
    final CelebrityBriefIntroductionState subState =
        CelebrityBriefIntroductionState();
    subState.briefIntroduction = state.celebrityData.summary;
    return subState;
  }

  @override
  void set(CelebrityState state, CelebrityBriefIntroductionState subState) {}
}

///影人的影视作品连接器
class CelebrityMoviesConnector
    extends ConnOp<CelebrityState, CelebrityMoviesState> {
  @override
  CelebrityMoviesState get(CelebrityState state) {
    final CelebrityMoviesState subState = CelebrityMoviesState();
    subState.celebrityData = state.celebrityData;
    return subState;
  }

  @override
  void set(CelebrityState state, CelebrityMoviesState subState) {}
}

///影人的相册连接器
class CelebrityPhotosConnector
    extends ConnOp<CelebrityState, CelebrityPhotosState> {
  @override
  CelebrityPhotosState get(CelebrityState state) {
    final CelebrityPhotosState subState = CelebrityPhotosState();
    subState.celebrityData = state.celebrityData;
    return subState;
  }

  @override
  void set(CelebrityState state, CelebrityPhotosState subState) {}
}
