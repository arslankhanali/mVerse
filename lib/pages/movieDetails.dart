import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mVerse/services/movie.dart';
import 'package:mVerse/state/app_state.dart';
import 'package:mVerse/redux/actions.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetails extends StatefulWidget {
  final Movie m;

  //final flutterWebviewPlugin = new FlutterWebviewPlugin();

  MovieDetails({Key key, this.m});

  @override
  _State createState() => _State();
}

class _State extends State<MovieDetails> {
  final List<String> listy = ['1', '2'];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        appBar: AppBar(
          title: Text(widget.m.title),
          //backgroundColor: Theme.of(context).accentColor,
          actions: <Widget>[
            Container(
              child: StoreConnector<AppState, AppState>(
                converter: (store) => store.state,
                builder: (context, state) {
                  final snackBar = SnackBar(content: Text("${widget.m.title} added to yourlist"));
                  return IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      
                      Scaffold.of(context).showSnackBar(snackBar);
                      StoreProvider.of<AppState>(context)
                          .dispatch(Fetchwatchlist(widget.m));
                      
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

            getTorrentButtons(widget.m),
            SizedBox(height: 15.0),
            getUrlLauncher(widget.m),

           

            SizedBox(height: 5.0),
            boxOne(),
            boxSecond(),
            //YoutubeWv(widget: widget),
            SizedBox(height: 10),
            //ImdbWv(widget: widget)
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
MPA rating: ${widget.m.mpaRating}                   
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
        tag: widget.m.hashCode,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Image(
            image: NetworkImage(widget.m.mediumCoverImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget getTorrentButtons(Movie m) {
    List<Widget> list = new List<Widget>();

    for (var i = 0; i < m.torrents.length; i++) {
      list.add(
        new FlatButton(
          child: Text('${m.torrents[i].quality}'),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('${m.torrents[i].quality}'),
                    content: Text("""
Seeds: ${m.torrents[i].seeds}
Peers: ${m.torrents[i].peers}
Size: ${m.torrents[i].size}
URL: ${m.torrents[i].url}
                    """),
                    actions: <Widget>[
                      FlatButton.icon(
                        icon: Icon(Icons.link),
                        label: Text('link'),
                        onPressed: () {
                          Clipboard.setData(
                              new ClipboardData(text: '${m.torrents[i].url}'));
                        },
                      ),
                      FlatButton.icon(
                        icon: Icon(Icons.content_copy),
                        label: Text('Copy'),
                        onPressed: () {
                          Clipboard.setData(
                              new ClipboardData(text: '${m.torrents[i].url}'));
                        },
                      ),
                      FlatButton.icon(
                        icon: Icon(Icons.close),
                        label: Text(''),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                });
          },
        ),
      );
    }
    return new Row(mainAxisAlignment: MainAxisAlignment.center, children: list);
  }

  Widget getUrlLauncher(Movie m) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton.icon(
          icon: Icon(Icons.local_movies),
          label: Text('IMDB'),
          onPressed: () async {
                    final url =  "https://www.imdb.com/title/${widget.m.imdbCode}";

                    if (await canLaunch(url)) {
                      await launch(url, forceWebView: true);
                    } else {
                      SnackBar(content: Text("Not Available"));
                    }
                  },
        ),
        FlatButton.icon(
          icon: Icon(Icons.play_circle_filled),
          label: Text('Trailer'),
          onPressed: () async {
                    final url =  "https://www.youtube.com/watch?v=${widget.m.ytTrailerCode}?autoplay=0";

                    if (await canLaunch(url)) {
                      await launch(url, forceWebView: true,enableJavaScript: true);
                    } else {
                      SnackBar(content: Text("Not Available"));
                    }
                  },
        ), 
      ],
    );
  }
}
