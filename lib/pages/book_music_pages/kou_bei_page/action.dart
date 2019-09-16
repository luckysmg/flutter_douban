import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_douban/entity/kou_bei_entity.dart';
import 'package:flutter_douban/pages/book_music_pages/kou_bei_page/kou_bei_list_adapter/kou_bei_list_item_component/state.dart';

enum KouBeiAction { action, init }

class KouBeiActionCreator {
  static Action onAction() {
    return const Action(KouBeiAction.action);
  }

  ///加载数据
  static Action init(List<KouBeiListItemState> data) {
    return Action(KouBeiAction.init, payload: data);
  }
}
