import 'package:flutter/material.dart';
import 'package:mVerse/pages/home.dart';
// import 'package:mVerse/pages/loading.dart';
//import 'package:mVerse/pages/choose_location.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      // '/home': (context) => Home(),
      // '/location': (context) => ChooseLocation(),

      //'/new_home': (context) => Home(),
      
    }
));

