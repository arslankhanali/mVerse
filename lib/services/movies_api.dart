import 'package:http/http.dart';
import 'dart:convert';
import 'package:mVerse/services/movie.dart';

class MovieData {
  int limit;
  String quality;
  String minimumrating;
  String queryterm;
  String genre;
  String sortby;
  String orderby;
  String withrtrating;
  String page;

  MovieData({this.limit});
  MovieData.search({this.sortby, this.limit});

  Future<List<Movie>> getMovies() async {
    List<Movie> ourlist = [];
    int pages = (limit / 50).ceil();
    Response response;

    for (int i = 1; i < pages + 1; i++) {
      String page = i.toString();
      // make the request

      String link =
          'https://yts.mx/api/v2/list_movies.json?limit=50&page=$page';

      //print(link);
      try {
        response = await get(link);
      } catch (e) {
        print("Could not fetch movies, Check internet connection");
      }

      Map data = jsonDecode(response.body);

      for (var m in data["data"]["movies"]) {
        Movie thismovie = Movie.fromJson(m);

        ourlist.add(thismovie);
      }

    }
    print("Total movies fetched: ${ourlist.length}");
    return ourlist;
  }


    Future<List<Movie>> searchMovies() async {
    List<Movie> searchedmovie = [];
    try{
      // make the request
      String linkquery = 'https://yts.mx/api/v2/list_movies.json?limit=$limit&page=$page&quality=$quality&minimum_rating=$minimumrating&query_term=$queryterm&genre=$genre&sort_by=$sortby&order_by=$orderby&with_rt_rating=$minimumrating';
      Response response = await get(linkquery);
      Map data = jsonDecode(response.body);

    }
    catch (e) {
      print(e);
      print("could not fetch movie/s");
    }

    return searchedmovie;

  }

}
