import 'package:mVerse/redux/actions.dart';
import 'package:mVerse/state/app_state.dart';


AppState reducer(AppState prevState,dynamic action){
  AppState newState=AppState.fromAppState(prevState);

  if (action is Fetchnumberofmovies ){
    newState.numberOfMovies.add(action.payload[0]);
  }

  // if (action is addamovie ){
  //   newState.numberOfMovies=action.payload;
  // }

  return newState;
}