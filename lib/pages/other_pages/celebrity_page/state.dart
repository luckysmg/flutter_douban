import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_douban/entity/celebrity_entity.dart';
import 'package:flutter_douban/entity/celebrity_works_entity.dart';
import 'package:flutter_douban/pages/other_pages/celebrity_page/celebrity_header_component/state.dart';

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
