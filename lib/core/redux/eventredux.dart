import 'package:redux/redux.dart';

import 'package:mcgithub/core/model/event.dart';

///
/// @author MichaelChou
/// @date 2018/11/20 10:55 PM
///

final eventReducer = combineReducers<List<Event>>([
  TypedReducer<List<Event>, RefreshEventAction>(_refresh),
  TypedReducer<List<Event>, LoadMoreEventAction>(_loadMore),
]);

List<Event> _refresh(List<Event> list, action) {
  list.clear();
  if (action.list == null) {
    return list;
  } else {
    list.addAll(action.list);
    return list;
  }
}

List<Event> _loadMore(List<Event> list, action) {
  if (action.list != null) {
    list.addAll(action.list);
  }
  return list;
}

class RefreshEventAction {
  final List<Event> list;

  RefreshEventAction(this.list);
}

class LoadMoreEventAction {
  final List<Event> list;

  LoadMoreEventAction(this.list);

}