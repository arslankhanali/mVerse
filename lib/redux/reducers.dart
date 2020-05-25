import 'package:mVerse/redux/actions.dart';
import 'package:mVerse/state/app_state.dart';
import 'package:mVerse/services/movie.dart';

AppState reducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);

  if (action is Fetchwatchlist) {
    if (!newState.watchlist.contains(action.payload)) {
      newState.watchlist.insert(0, action.payload);
      // newState.watchlist.add(action.payload);
    }
  }

  return newState;
}
