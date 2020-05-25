import 'package:flutter/material.dart';
import 'package:mVerse/state/app_state.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mVerse/widgets/movielist.dart';

class Watchlistpage extends StatefulWidget {
  @override
  _WatchlistpageState createState() => _WatchlistpageState();
}

class _WatchlistpageState extends State<Watchlistpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart'),
      backgroundColor: Theme.of(context).accentColor,),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20,),
          StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            builder: (context, state) {
              return  Latestmovie(ourlist: state.viewwatchlist, context: context);
              // ListView( 
              //   scrollDirection: Axis.vertical,
              //   children: <Widget>[
              //   Latestmovie(ourlist: state.viewwatchlist, context: context)
              // ],
              // );
          
            },
          ),
        ],
      ),
    );
  }
}
