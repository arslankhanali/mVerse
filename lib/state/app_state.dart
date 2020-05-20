import 'package:flutter/material.dart';

class AppState{
  int numberOfMovies;

  AppState({this.numberOfMovies});

  AppState.fromAppState(AppState another){
    numberOfMovies=another.numberOfMovies;
  }

  int get viewnumberofmovies=> numberOfMovies;

}