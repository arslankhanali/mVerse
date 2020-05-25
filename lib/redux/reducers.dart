import 'package:mVerse/redux/actions.dart';
import 'package:mVerse/state/app_state.dart';

// import 'package:shared_preferences/shared_preferences.dart';


AppState reducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);
  // obtain shared preferences


  if (action is Fetchwatchlist) {
    if (!newState.watchlist.contains(action.payload)) {
      newState.watchlist.insert(0, action.payload);
      // newState.watchlist.add(action.payload);
    }
  }

  return newState;
}

// void addtostore(AppState newState) async{

//     final prefs = await SharedPreferences.getInstance();

// // set value
// prefs.se
// prefs.setStringList(key, value)
//   prefs.setInt('AppState', newState);
// }