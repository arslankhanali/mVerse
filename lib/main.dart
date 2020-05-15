import 'package:flutter/material.dart';
// import 'package:mVerse/pages/home.dart';
// import 'package:mVerse/pages/loading.dart';
//import 'package:mVerse/pages/choose_location.dart';
import 'package:mVerse/pages/loading_movies.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/loading_movies',
    routes: {
      // '/': (context) => Loading1(),
      // '/home': (context) => Home(),
      // '/location': (context) => ChooseLocation(),

      //'/new_home': (context) => Home(),
      '/loading_movies': (context) => Loading(),
    }
));

