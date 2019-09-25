import 'package:fish_redux/fish_redux.dart';

class TopHeaderState implements Cloneable<TopHeaderState> {

  @override
  TopHeaderState clone() {
    return TopHeaderState();
  }
}

TopHeaderState initState(Map<String, dynamic> args) {
  return TopHeaderState();
}
