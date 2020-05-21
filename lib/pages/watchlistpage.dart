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
              return Container(
                  child: Column(
                children: <Widget>[
                  Text('${state.viewnumberofmovies}'),
                  IconButton(
                    icon: Icon(Icons.keyboard_arrow_up),
                    onPressed: () {
                      StoreProvider.of<AppState>(context).dispatch(
                          Fetchnumberofmovies(state.viewnumberofmovies + 1));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_downward),
                    onPressed: () {
                      StoreProvider.of<AppState>(context).dispatch(
                          Fetchnumberofmovies(state.viewnumberofmovies - 1));
                    },
                  ),
                ],
              ));
            },
          ),
        ],
      ),
    );
  }
}
