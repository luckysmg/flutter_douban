import 'package:fish_redux/fish_redux.dart';

import 'state.dart';
import 'view.dart';

class CelebrityMoviesComponent extends Component<CelebrityMoviesState> {
  CelebrityMoviesComponent()
      : super(
            view: buildView,
            dependencies: Dependencies<CelebrityMoviesState>(
                adapter: null,
                slots: <String, Dependent<CelebrityMoviesState>>{
                }),);

}
