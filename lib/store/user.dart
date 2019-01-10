import '../models/user.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import '../service.dart';

class SetUserAction {
  User user;
  SetUserAction(this.user);
}

User reducer(User prev, dynamic action) {
  if (action is SetUserAction) {
    return action.user;
  }
  return prev;
}

ThunkAction<User> fetchMyself() {
  return (Store<User> store) async {
    User me = await fetchMe();
    store.dispatch(new SetUserAction(me));
  };
}

final store = new Store<User>(
  reducer,
  initialState: User.empty(),
  middleware: [
    thunkMiddleware
  ]
);