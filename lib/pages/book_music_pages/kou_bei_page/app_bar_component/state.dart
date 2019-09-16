import 'package:fish_redux/fish_redux.dart';

class AppBarState implements Cloneable<AppBarState> {
  var titleOpacity = 0.0;

  @override
  AppBarState clone() {
    return AppBarState()..titleOpacity = titleOpacity;
  }
}

AppBarState initState(Map<String, dynamic> args) {
  return AppBarState();
}
