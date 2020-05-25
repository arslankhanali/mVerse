import 'package:flutter/material.dart';
import 'package:mVerse/pages/search.dart';
import 'package:mVerse/services/movie.dart';
import 'package:mVerse/services/movies_api.dart';
import 'package:mVerse/widgets/movielist.dart';
import 'package:mVerse/widgets/title.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Movie> _ourlist;

  void fetchMovies() async {
    List<Movie> ourlist;
    MovieData instance = MovieData(limit: 50);
    ourlist = await instance.getMovies();

    setState(() {
      _ourlist = ourlist;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: Container(
            child: ListView(
              children: <Widget>[
                TitleBar(context: context, lineone: "Movie", linetwo: "Universe"),
                //searchBar(),
                SizedBox(height: 20.0),
                Latestmovie(ourlist: _ourlist, context: context),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () { Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SearchMovie(
                  )));
        },
        child: Icon(Icons.search, color: Colors.white),
        backgroundColor: Colors.black87,
      ),);
  }
}

