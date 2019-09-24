import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';

class CelebrityBriefIntroductionComponent extends Component<CelebrityBriefIntroductionState> {
  CelebrityBriefIntroductionComponent()
      : super(
            view: buildView,
            dependencies: Dependencies<CelebrityBriefIntroductionState>(
                adapter: null,
                slots: <String, Dependent<CelebrityBriefIntroductionState>>{
                }),);

}
