import 'package:flutter/material.dart';
import 'package:mVerse/pages/home.dart';
import 'package:mVerse/pages/movieDetails.dart';
// import 'package:mVerse/pages/loading.dart';
//import 'package:mVerse/pages/choose_location.dart';

void main() => runApp(MaterialApp(
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
      // '/location': (context) => ChooseLocation(),

      //'/new_home': (context) => Home(),
      
    }
    
));

