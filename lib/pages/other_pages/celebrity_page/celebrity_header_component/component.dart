import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';

class CelebrityHeaderComponent extends Component<CelebrityHeaderState> {
  CelebrityHeaderComponent()
      : super(
            view: buildView,
            dependencies: Dependencies<CelebrityHeaderState>(
                adapter: null,
                slots: <String, Dependent<CelebrityHeaderState>>{
                }),);

}
