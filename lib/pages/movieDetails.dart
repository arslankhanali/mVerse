import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mVerse/services/movie_class.dart';
import 'package:mVerse/state/app_state.dart';
import 'package:mVerse/redux/reducers.dart';
import 'package:mVerse/redux/actions.dart';

class MovieDetails extends StatefulWidget {
  final Movie m;

  const MovieDetails({Key key, this.m});

  @override
  _State createState() => _State();
}

class _State extends State<MovieDetails> {
  @override

  // StoreConnector<AppState,AppState>(
  //       converter: (store) => store.state,
  //       builder: (context, state) {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        appBar: AppBar(
          title: Text(widget.m.title),
          actions: <Widget>[
            Container(
              child: StoreConnector<AppState, AppState>(
                converter: (store) => store.state,
                builder: (context, state) {
                  return IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      StoreProvider.of<AppState>(context).dispatch(
                          Fetchnumberofmovies(state.viewnumberofmovies + 1));
                    },
                  );
                },
              ),
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.only(top: 10.0),
          children: <Widget>[
            poster(),
            SizedBox(height: 5.0),
            boxOne(),
            boxSecond(),
          ],
        ));
  }

  Container boxSecond() {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 325.0,
      height: 125,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(6.0),
            child: Text(
              '${widget.m.summary}',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Container boxOne() {
    return Container(
      margin: EdgeInsets.all(30.0),
      width: 60.0,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListView(padding: EdgeInsets.all(10.0), children: <Widget>[
        Center(
          child: Text(
            """
Title: ${widget.m.title}
Year: ${widget.m.year} 
Rating: ${widget.m.rating}/10 
Runtime: ${widget.m.runtime}mins 
Genres: ${widget.m.genres} 
MPA rating: ${widget.m.mparating}                   
""",
// torrentsurl: ${widget.m.torrenturl}
// torrents: ${widget.m.torrents}
// imdb: https://www.imdb.com/title/${widget.m.imdbcode}
//yt_trailer_code: https://www.youtube.com/watch?v=${widget.m.yttrailercode}
            //textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ]),
    );
  }

  Container poster() {
    return Container(
      alignment: Alignment.center,
      child: Hero(
        tag: widget.m.id,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Image(
            image: NetworkImage(widget.m.mediumcoverimage),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
