import 'package:fish_redux/fish_redux.dart';

class CelebrityHeaderState implements Cloneable<CelebrityHeaderState> {
  String photoUrl;
  String name;
  String nameEn;

  @override
  CelebrityHeaderState clone() {
    return CelebrityHeaderState()
      ..photoUrl = photoUrl
      ..name = name
      ..nameEn = nameEn;
  }
}

CelebrityHeaderState initState(Map<String, dynamic> args) {
  return CelebrityHeaderState();
}
