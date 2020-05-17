import 'package:flutter/material.dart';
import 'package:mVerse/services/movie_class.dart';
import 'package:mVerse/services/movies_api.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Movie> _ourlist;

  void fetchMovies() async {
    List<Movie> ourlist;
    MovieData instance = MovieData(limit: '50');
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
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("mVerse"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: _ourlist == null
          ? Center(child: LinearProgressIndicator())
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1.0,
                  mainAxisSpacing: 1.0),
              itemCount: _ourlist.length,
              itemBuilder: (context, index) {
                Movie m = _ourlist[index];
                print(m.title);
                print(m.largecoverimage);
                return Container(
                  height: 200,
                  width: 100,
                  child: Column(
                    children: <Widget>[
                      Text(
                        '${m.title} ${m.rating}',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 150,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image(
                            image: NetworkImage(m.largecoverimage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
