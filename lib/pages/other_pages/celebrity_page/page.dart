import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_douban/pages/other_pages/celebrity_page/celebrity_brief_introduction/component.dart';
import 'package:flutter_douban/pages/other_pages/celebrity_page/celebrity_header_component/component.dart';
import 'package:flutter_douban/pages/other_pages/celebrity_page/celebrity_movies_component/component.dart';
import 'package:flutter_douban/pages/other_pages/celebrity_page/celebrity_photos/component.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

///
/// @created by 文景睿
/// description:影人详情页面
///
class CelebrityPage extends Page<CelebrityState, Map<String, dynamic>> {
  CelebrityPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<CelebrityState>(
              slots: <String, Dependent<CelebrityState>>{
                'CelebrityHeader':
                    CelebrityHeaderConnector() + CelebrityHeaderComponent(),
                'celebrityBriefIntroduction':
                    CelebrityBriefIntroductionConnector() +
                        CelebrityBriefIntroductionComponent(),
                'celebrityMovies':
                    CelebrityMoviesConnector() + CelebrityMoviesComponent(),
                'celebrityPhotos':
                    CelebrityPhotosConnector() + CelebrityPhotosComponent()
              }),
        );
}
