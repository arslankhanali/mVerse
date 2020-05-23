import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mVerse/pages/home.dart';
import 'package:mVerse/pages/movieDetails.dart';
import 'package:mVerse/pages/test.dart';
import 'package:mVerse/redux/actions.dart';
import 'package:redux/redux.dart';
import 'package:mVerse/state/app_state.dart';
import 'package:mVerse/redux/reducers.dart';

void main() {
  final _initialState = AppState(numberOfMovies: []);
  final Store<AppState> _store=Store<AppState>(reducer,initialState: _initialState);

  runApp(MyApp(store:_store));
  
} 


class MyApp extends StatelessWidget {

  final Store<AppState> store;
  MyApp({this.store});


  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store:store,
          child: MaterialApp(
  
  debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.yellow[800],
          canvasColor: Colors.black,
          scaffoldBackgroundColor: Color(0xFFF3F5F7),
          backgroundColor:Colors.white,
        ),
      routes: {
        '/': (context) => Home(),
        '/moviedetails': (context) => MovieDetails(),
        '/test': (context) => Test(),
      
      }
      
),
    );
  }}