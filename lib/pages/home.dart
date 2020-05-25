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
                // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        drawer: Drawer(
          //elevation: 100.0,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.fromLTRB(10.0,30.0,10.0,10.0),
          children: <Widget>[
            DrawerHeader(
              child: Text('SHOUT OUT!', style: TextStyle(
                fontFamily: 'RockSalt',
                 fontSize: 30.0,
                 fontWeight: FontWeight.bold,
                 letterSpacing: 5.0,
                 wordSpacing: 10.0,
                 fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).splashColor,
               borderRadius: BorderRadius.circular(15.0),
     
              ),
            ),
            Container(
              height: 400,
              decoration: BoxDecoration(
                color: Theme.of(context).splashColor,
               borderRadius: BorderRadius.circular(15.0),
     
              ),
              child: ListTile(
                title: Text("""
IBI I nCO
BHARRU MANDA CHANNA
AB USI MICKEY
ARON ABHI IRTZ
& All the peeps I met
@ ANU n LMZ

                """
                , style: TextStyle(
                  fontFamily: 'RockSalt',
                  fontStyle: FontStyle.italic,
                   fontSize: 15.0,
                   fontWeight: FontWeight.bold,
                   letterSpacing: 5.0,
                   wordSpacing: 10.0,
                   color: Colors.black,
                ),
                textAlign: TextAlign.center,),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
        body: SafeArea(
          child: Container(
            child: ListView(
              children: <Widget>[
                SizedBox(height:30),
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

