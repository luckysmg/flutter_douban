import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_douban/http/dio_util.dart';
import 'action.dart';
import 'state.dart';

Effect<KouBeiState> buildEffect() {
  return combineEffects(<Object, Effect<KouBeiState>>{
    KouBeiAction.action: _onAction,
    Lifecycle.initState: _onInit,
  });
}

void _onAction(Action action, Context<KouBeiState> ctx) {}

void _onInit(Action action, Context<KouBeiState> ctx) {}
