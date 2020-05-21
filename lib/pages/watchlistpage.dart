import 'package:flutter/material.dart';
import 'package:mVerse/state/app_state.dart';
import 'package:mVerse/redux/actions.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mVerse/services/movie_class.dart';

class Watchlistpage extends StatefulWidget {
  @override
  _WatchlistpageState createState() => _WatchlistpageState();
}

class _WatchlistpageState extends State<Watchlistpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Column(
        children: <Widget>[
          StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (context, state) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: state.viewnumberofmovies.length,
                  itemBuilder: (context, index) {
                    String m = state.viewnumberofmovies[index];
                    //print(m.title);

                    return Container(
                      child:Text(m),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
