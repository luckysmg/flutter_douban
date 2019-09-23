import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_douban/entity/celebrity_entity.dart';
import 'package:flutter_douban/entity/celebrity_works_entity.dart';
import 'package:flutter_douban/http/dio_util.dart';
import 'package:flutter_douban/http/mock_request.dart';
import 'package:flutter_douban/util/constants.dart';
import 'action.dart';
import 'state.dart';

Effect<CelebrityState> buildEffect() {
  return combineEffects(<Object, Effect<CelebrityState>>{
    CelebrityAction.action: _onAction,
    Lifecycle.initState: _onInit
  });
}

void _onAction(Action action, Context<CelebrityState> ctx) {}

void _onInit(Action action, Context<CelebrityState> ctx) async {
  CelebrityEntity celebrityEntity;
  CelebrityWorksEntity worksEntity;

  if (Constants.isRealNetworkData) {
    var getCelebrityData = DioUtil.getInstance()
        .get(
            url:
                'movie/celebrity/${ctx.state.id}?apikey=0b2bdeda43b5688921839c8ecb20399b')
        .then((data) {
      celebrityEntity = CelebrityEntity.fromJson(data);
    });
    var getCelebrityWorksData = DioUtil.getInstance()
        .get(
            url:
                'movie/celebrity/${ctx.state.id}/works?apikey=${Constants.API_KEY}')
        .then((data) {
      worksEntity = CelebrityWorksEntity.fromJson(data);
    });

    await Future.wait([getCelebrityData, getCelebrityWorksData]);
    ctx.dispatch(CelebrityActionCreator.init([celebrityEntity, worksEntity]));
  } else {
    await MockRequest.mock('celebrity').then((data) {
      celebrityEntity = CelebrityEntity.fromJson(data);
    });

    await MockRequest.mock('celebrity_works').then((data) {
      worksEntity = CelebrityWorksEntity.fromJson(data);
    });

    await Future.delayed(Duration(milliseconds: 1500));
    ctx.dispatch(CelebrityActionCreator.init([celebrityEntity, worksEntity]));
  }
}
