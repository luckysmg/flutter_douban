import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'app_bar_component/action.dart';
import 'state.dart';

Effect<KouBeiState> buildEffect() {
  return combineEffects(<Object, Effect<KouBeiState>>{
    KouBeiAction.action: _onAction,
    Lifecycle.initState: _onInit,
    Lifecycle.dispose: _onDispose
  });
}

void _onAction(Action action, Context<KouBeiState> ctx) {}

///设置滚动监听器，获取数据
void _onInit(Action action, Context<KouBeiState> ctx) async {
  ///设置滚动监听
  ctx.state.scrollController.addListener(() {
    ctx.dispatch(AppBarActionCreator.onUpdateTitleOpacity(
        ctx.state.scrollController.offset));
  });
}

void _onDispose(Action action, Context<KouBeiState> ctx) {
  ctx.state.scrollController.dispose();
}
