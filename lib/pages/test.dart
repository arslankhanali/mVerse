import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutube/flutube.dart';
// import 'package:mVerse/services/movie_class.dart';
import 'package:mVerse/services/movie.dart';
import 'package:mVerse/state/app_state.dart';
import 'package:mVerse/redux/reducers.dart';
import 'package:mVerse/redux/actions.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //Text('https://www.youtube.com/watch?v=YzPq8uVgLe8'),
            Container(
              margin: EdgeInsets.all(10.0),
              width: 400.0,
              height: 800.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: FluTube(
                'https://www.youtube.com/watch?v=YzPq8uVgLe8',
                autoInitialize: true,
                aspectRatio: 4 / 4,
                allowMuting: false,
                looping: true,
                onVideoStart: () {},
                onVideoEnd: () {},
                autoPlay: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
