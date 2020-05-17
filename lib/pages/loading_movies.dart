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
  List<Movie> _ourlist;

  Future<List<Movie>> fetchMovies() async {
    MovieData instance = MovieData(limit: '50');
    _ourlist = await instance.getMovies();
    return _ourlist;
  }

  @override
  void initState() async {
    super.initState();
    await fetchMovies();
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
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 1.0, mainAxisSpacing: 1.0),
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
              // return Container(
              //     height: 160.0,
              //     width: 200.0,
              //     decoration: BoxDecoration(
              //       //color: Colors.white,
              //       borderRadius: BorderRadius.circular(20.0),
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.black26,
              //           offset: Offset(0.0, 2.0),
              //           blurRadius: 20.0,
              //         ),
              //       ],
              //     ),
              //     child: Stack(
              //       alignment: Alignment.center,
              //       children: <Widget>[
              // Hero(
              //   tag: snapshot.data[index].title,
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(20.0),
              //     child: Image(
              //       height: 180.0,
              //       width: 180.0,

              //       image: NetworkImage(snapshot.data[index].largecoverimage),
              //       fit: BoxFit.fill,
              //     ),
              //   ),
              // ),
              //     Positioned(
              //       left: 15.0,
              //       bottom: 10.0,
              //       child: Column(
              //         children: <Widget>[
              //           Text(
              //             snapshot.data[index].rating,
              //             style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 20.0,
              //               fontWeight: FontWeight.w600,
              //               letterSpacing: 1.2,
              //             ),
              //           ),
              //           Row(
              //             mainAxisAlignment:
              //                 MainAxisAlignment.spaceBetween,
              //             children: <Widget>[
              //               Icon(
              //                 Icons.star,
              //                 size: 10.0,
              //                 color: Colors.white,
              //               ),
              //               Text(
              //                 '   rating',
              //                 style: TextStyle(
              //                   color: Colors.white,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     )
              //   ],
              // ));
            }));
  }
}
