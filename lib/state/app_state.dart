import 'package:flutter/material.dart';
import 'package:mVerse/services/movie.dart';

class AppState{
  // List<String> movielist;
  List<Movie> watchlist;

  AppState({this.watchlist});

  AppState.fromAppState(AppState another){
    watchlist=another.watchlist;
  }

  List<Movie> get viewwatchlist=> watchlist;

}