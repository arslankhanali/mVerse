import 'package:flutter/material.dart';

class AppState{
  // List<String> movielist;
  int numberOfMovies;

  AppState({this.numberOfMovies});

  AppState.fromAppState(AppState another){
    numberOfMovies=another.numberOfMovies;
  }

  int get viewnumberofmovies=> numberOfMovies;

}