import 'package:flutter/material.dart';

class AppState{
  // List<String> movielist;
  List<String> numberOfMovies;

  AppState({this.numberOfMovies});

  AppState.fromAppState(AppState another){
    numberOfMovies=another.numberOfMovies;
  }

  List<String> get viewnumberofmovies=> numberOfMovies;

}