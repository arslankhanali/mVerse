import 'package:flutter/material.dart';
import 'package:mVerse/services/latest_movies.dart';
import 'package:mVerse/services/Movie.dart';
// import 'package:mVerse/services/world_time.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  List<Movie> ourlist;

  Future<List<Movie>> fetchMovies() async {
    MovieData instance = MovieData(limit: '50');
    ourlist = await instance.getMovies();
    return ourlist;
  }

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Container(
          child: FutureBuilder(
              future: fetchMovies(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: Text("loading..."),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 1.0, horizontal: 4.0),
                        child: Card(
                          child: ListTile(
                            // onTap: () {
                            //   updateTime(index);
                            // },
                            title: Text(snapshot.data[index].title),
                            // leading: CircleAvatar(
                            //   backgroundImage: Image.network('https://https://sproutsocial.com/insights/social-media-image-sizes-guide/') ,
                            // ),
                          ),
                        ),
                      );
                    },
                  );
                }
              })),
    );
  }
}
