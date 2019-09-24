import 'package:fish_redux/fish_redux.dart';

class CelebrityBriefIntroductionState
    implements Cloneable<CelebrityBriefIntroductionState> {
  String briefIntroduction;

  @override
  CelebrityBriefIntroductionState clone() {
    return CelebrityBriefIntroductionState()
      ..briefIntroduction = briefIntroduction;
  }
}

CelebrityBriefIntroductionState initState(Map<String, dynamic> args) {
  return CelebrityBriefIntroductionState();
}
