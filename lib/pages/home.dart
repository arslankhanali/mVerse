import 'package:flutter/material.dart';
import 'package:mVerse/pages/movieDetails.dart';
import 'package:mVerse/services/movie_class.dart';
import 'package:mVerse/services/movies_api.dart';
import 'package:transparent_image/transparent_image.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Movie> _ourlist;

  void fetchMovies() async {
    List<Movie> ourlist;
    MovieData instance = MovieData(limit: 10);
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
        // appBar: AppBar(
        //   title: Text("mVerse"),
        //   centerTitle: true,
        //   backgroundColor: Colors.green,
        // ),
        body: SafeArea(
          child: Container(
            child: ListView(
              children: <Widget>[
                SizedBox(height: 10.0),
                title(),
                searchBar(),
                SizedBox(height: 20.0),
                lastestmovies(),
              ],
            ),
          ),
        ));
  }

  Container lastestmovies() {
    return Container(
      child: _ourlist == null
          ? Center(
              heightFactor: MediaQuery.of(context).size.width / 4.5,
              child: LinearProgressIndicator())
          : ListView.builder(
              //scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: _ourlist.length,

              itemBuilder: (context, index) {
                Movie m = _ourlist[index];
                //print(m.title);

                return Container(
                  margin: EdgeInsets.all(5.0),
                  width: 400.0,
                  height: 350,
                  decoration: BoxDecoration(
                    //color: Colors.red,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(15.0),
                        width: 390.0,
                        height: 340,
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 130),
                        child: Container(
                          margin: EdgeInsets.all(15.0),
                          width: 200.0,
                          height: 190,
                          decoration: BoxDecoration(
                            //color: Colors.blue,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                '${m.titlelong} ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'imdb: ${m.rating}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Runtime: ${m.runtime} min',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              // SizedBox(height: 5),
                              //   Text(
                              //   'PG Rating: ${m.mparating}',
                              //   style: TextStyle(
                              //       color: Colors.black,
                              //       fontSize: 15,
                              //       fontWeight: FontWeight.bold),
                              // ),
                              SizedBox(height: 5),
                              Text(
                                'Genre: ${m.genres}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Language: ${m.language}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 5, top: 195, bottom: 5.0),
                        child: Container(
                          margin: EdgeInsets.all(15.0),
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
                                  '${m.summary}',
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MovieDetails(
                              m: m,
                            ),
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.topLeft,
                          height: 200,
                          width: 134,
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 40.0,
                              ),
                            ],
                          ),
                          child: Hero(
                            tag: m.id,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: m.mediumcoverimage,
                                fit: BoxFit.contain,
                              ),
                              // child: Image(
                              //   image: NetworkImage(m.mediumcoverimage),
                              //   fit: BoxFit.contain,

                              // ),
                            ),
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

  Widget searchBar() {
    return ListTile(
        leading: Icon(Icons.search, color: Colors.black45),
        title: TextField(
          decoration: InputDecoration(
              hintText: "Find a movie....",
              //contentPadding: EdgeInsets.symmetric(vertical: 10),
              hintStyle: TextStyle(
                color: Colors.black87,
              ),
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red))),
        ),
        trailing: Icon(Icons.movie_filter, color: Theme.of(context).accentColor));
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: <Widget>[
    //     Icon(
    //       Icons.search,
    //       color: Colors.black45,
    //     ),
    //     SizedBox(width: 20),
    //     Expanded(
    //       child: TextField(
    //         decoration: InputDecoration(
    //             hintText: "Search....",
    //             contentPadding: EdgeInsets.symmetric(vertical: 10),
    //             hintStyle: TextStyle(
    //               color: Colors.black87,
    //             ),
    //             border: UnderlineInputBorder(
    //                 borderSide: BorderSide(color: Colors.red))),
    //       ),
    //     ),
    //   ],
    // );
  }

  Widget title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 45),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Want to watch",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
            Text(
              "something ?",
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 30,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 40),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(50.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0, 2.0),
                  blurRadius: 20.0,
                ),
              ],
            ),
            child: IconButton(
                icon: Icon(Icons.menu),
                iconSize: 30.0,
                color: Colors.white,
                onPressed: null),
          ),
        ),
      ],
    );
  }
}
