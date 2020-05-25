import 'package:flutter/material.dart';
// import 'package:mVerse/services/movie_class.dart';
import 'package:mVerse/services/movie.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:mVerse/pages/movieDetails.dart';

class Latestmovie extends StatelessWidget {
  const Latestmovie({
    Key key,
    @required List<Movie> ourlist,
    @required this.context,
  }) : _ourlist = ourlist, super(key: key);

  final List<Movie> _ourlist;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _ourlist == null
          ? Center(
            heightFactor: MediaQuery.of(context).size.width/4.5,
            child: LinearProgressIndicator())
          : ListView.builder(
            
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
                                '${m.titleLong} ',
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
                                image: m.mediumCoverImage,
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
}
