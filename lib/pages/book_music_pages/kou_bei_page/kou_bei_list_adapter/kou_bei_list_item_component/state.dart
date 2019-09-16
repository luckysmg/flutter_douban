import 'package:fish_redux/fish_redux.dart';

class KouBeiListItemState implements Cloneable<KouBeiListItemState> {
  String title;

  @override
  KouBeiListItemState clone() {
    return KouBeiListItemState()..title = title;
  }
}

KouBeiListItemState initState(Map<String, dynamic> args) {
  return KouBeiListItemState();
}
