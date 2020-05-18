import 'package:flutter/material.dart';
import 'package:mVerse/services/movie_class.dart';
import 'package:mVerse/services/movies_api.dart';
import 'package:transparent_image/transparent_image.dart';


class MovieDetails extends StatefulWidget {
  final Movie m;

  const MovieDetails({Key key, this.m});

  @override
  _State createState() => _State();
}

class _State extends State<MovieDetails> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
          body: Container(
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
        
      ),
    );
  }
}

