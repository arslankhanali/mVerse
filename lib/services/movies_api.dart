import 'package:http/http.dart';
import 'dart:convert';
import 'package:mVerse/services/movie_class.dart';



class MovieData {
  String limit; 
  String page;
  String quality;
  String minimumrating;
  String queryterm;
  String genre;
  String sortby;
  String orderby;
  String withrtrating ; 
  
  


  MovieData({this.limit});
  MovieData.search({this.sortby,this.limit});
  

  Future<List<Movie>> getMovies() async {

    List<Movie>  ourlist=[];

    try{
      // make the request
      String link = 'https://yts.mx/api/v2/list_movies.json?limit=$limit';
      
      
      Response response = await get(link);
      Map data = jsonDecode(response.body);
      

      for (var m in data["data"]["movies"]){
        //print(m);
        Movie movie= Movie(m["id"], m["url"], m["imdb_code"],
         m["title"], m["title_long"], m["year"], m["rating"],
          m["runtime"], m["genres"], m["summary"], m["yt_trailer_code"],
           m["language"], m["mpa_rating"], m["large_cover_image"], m["medium_cover_image"], m["torrents"],m);
        ourlist.add(movie);
      }
      return ourlist;
    }
    catch (e) {
      print(e);
      print("could not fetch movie/s");
    }

    return null;

  }
    Future<void> searchMovies() async {
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

    // List<Movie>

  }


}