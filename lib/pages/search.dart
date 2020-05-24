import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mVerse/services/movie.dart';
import 'package:mVerse/services/movies_api.dart';
import 'package:mVerse/widgets/searchedmovielist.dart';

class SearchMovie extends StatefulWidget {
  @override
  _SearchMovieState createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie> {
  List<Movie> _ourlist;
  
  String dropdownValue = 'One';
  bool loading= true;
  String queryterm="empty";

  void searchMovies(value) async {
    List<Movie> ourlist;
    MovieData instance = MovieData.search(queryterm: value);
    ourlist = await instance.searchMovies();

    setState(() {
      _ourlist = ourlist;
      queryterm=value;
      loading= false;
  
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Search"),
          backgroundColor: Theme.of(context).accentColor,
        ),
        body: ListView(
          children: <Widget>[
            searchbar(),
            SizedBox(height: 20,),
            //_ourlist.length!=null ?
            Searchmovie(ourlist: _ourlist, context: context,queryterm:queryterm),
            //Text("Not found")
            
          ],
        ));
  }

  Row searchbar() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                Icons.search,
                color: Colors.black45,
              ),
              SizedBox(width: 20),
              Expanded(
                child: TextField(
                  onSubmitted: (String value) async {
                    searchMovies(value);
                  },
                  decoration: InputDecoration(
                    hintText: "Search....",
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    hintStyle: TextStyle(
                      color: Colors.black87,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
