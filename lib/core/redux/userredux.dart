import 'package:redux/redux.dart';

import 'package:mcgithub/core/model/user.dart';

///
/// @author MichaelChou
/// @date 2018/11/20 10:32 PM
///

final userReducer = combineReducers<User>([
  TypedReducer<User, UpdateUserAction>(_updateLoaded),
]);

User _updateLoaded(User user, action) {
  user = action.userInfo;
  return user;
}

class UpdateUserAction {
  final User userInfo;
  UpdateUserAction(this.userInfo);
}