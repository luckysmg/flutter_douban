import 'package:fish_redux/fish_redux.dart';

class PersistentHeaderState implements Cloneable<PersistentHeaderState> {

  @override
  PersistentHeaderState clone() {
    return PersistentHeaderState();
  }
}

PersistentHeaderState initState(Map<String, dynamic> args) {
  return PersistentHeaderState();
}
