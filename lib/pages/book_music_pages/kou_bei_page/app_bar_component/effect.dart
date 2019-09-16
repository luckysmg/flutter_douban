import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<AppBarState> buildEffect() {
  return combineEffects(<Object, Effect<AppBarState>>{
    AppBarAction.action: _onAction,
    AppBarAction.onUpdateTitleOpacity: _onUpdateTitleOpacity,
  });
}

void _onAction(Action action, Context<AppBarState> ctx) {}

///获取透明度和offset之间的数学关系
void _onUpdateTitleOpacity(Action action, Context<AppBarState> ctx) async {
  var opacity;
  if (action.payload < 70) {
    opacity = 0.0;
    ctx.dispatch(AppBarActionCreator.updateTitleOpacity(opacity));
    return;
  }
  if (action.payload > 155) {
    opacity = 1.0;
    ctx.dispatch(AppBarActionCreator.updateTitleOpacity(opacity));
    return;
  }

  opacity = (action.payload - 70) / 85;
  if (action.payload > 200) {
    return;
  }
  ctx.dispatch(AppBarActionCreator.updateTitleOpacity(opacity));
}
