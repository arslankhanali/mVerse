
class Movie {
  final int id;
  final String url;
  final String imdbcode;
  final String title;
  final String titlelong;
  final int year;
  final dynamic rating;
  final int runtime;
  final List genres;
  final String summary;
  final String yttrailercode;
  final String language;
  final String mparating;
  final String largecoverimage;
  final String mediumcoverimage;
  final List torrents;
  final dynamic data;
  final String torrenturl;

  Movie(this.id, this.url, this.imdbcode, this.title, this.titlelong,
   this.year, this.rating, this.runtime, this.genres, this.summary,
    this.yttrailercode, this.language, this.mparating, this.largecoverimage, this.mediumcoverimage,this.torrents,this.data, this.torrenturl);

  
  // factory Movie.fromJson(Map<String, dynamic> json) {
  //   return Movie(
  //     albumId: json['albumId'] as int,
  //     id: json['id'] as int,
  //     title: json['title'] as String,
  //     url: json['url'] as String,
  //     thumbnailUrl: json['thumbnailUrl'] as String,
  //   );
  // }
  //               "id": 17557,
  //               "url": "https://yts.mx/movie/stand-strong-2011",
  //               "imdb_code": "tt2053436",
  //               "title": "Stand Strong",
  //               "title_english": "Stand Strong",
  //               "title_long": "Stand Strong (2011)",
  //               "slug": "stand-strong-2011",
  //               "year": 2011,
  //               "rating": 5.9,
  //               "runtime": 0,
  //               "genres": [
  //                   "Drama",
  //                   "Family"
  //               ],
  //               "summary": "Matt Webster measures his success by his possessions. Though he appears to have it all, pride of ownership does little to fill the void of a purposeless life. Broken relationships, isolation and pain for both himself and his family are the results of his pride and selfishness. Through a series of financial and family crises, Matt and his family are stripped of all they own and are humbled enough to learn what success is really all about.",
  //               "description_full": "Matt Webster measures his success by his possessions. Though he appears to have it all, pride of ownership does little to fill the void of a purposeless life. Broken relationships, isolation and pain for both himself and his family are the results of his pride and selfishness. Through a series of financial and family crises, Matt and his family are stripped of all they own and are humbled enough to learn what success is really all about.",
  //               "synopsis": "Matt Webster measures his success by his possessions. Though he appears to have it all, pride of ownership does little to fill the void of a purposeless life. Broken relationships, isolation and pain for both himself and his family are the results of his pride and selfishness. Through a series of financial and family crises, Matt and his family are stripped of all they own and are humbled enough to learn what success is really all about.",
  //               "yt_trailer_code": "",
  //               "language": "English",
  //               "mpa_rating": "",
  //               "background_image": "https://yts.mx/assets/images/movies/stand_strong_2011/background.jpg",
  //               "background_image_original": "https://yts.mx/assets/images/movies/stand_strong_2011/background.jpg",
  //               "small_cover_image": "https://yts.mx/assets/images/movies/stand_strong_2011/small-cover.jpg",
  //               "medium_cover_image": "https://yts.mx/assets/images/movies/stand_strong_2011/medium-cover.jpg",
  //               "large_cover_image": "https://yts.mx/assets/images/movies/stand_strong_2011/large-cover.jpg",
  //               "state": "ok",
  //               "torrents": [
  //                   {
  //                       "url": "https://yts.mx/torrent/download/3EF44D7628C80C217A56FBA76ED283A5743D1577",
  //                       "hash": "3EF44D7628C80C217A56FBA76ED283A5743D1577",
  //                       "quality": "720p",
  //                       "type": "web",
  //                       "seeds": 0,
  //                       "peers": 0,
  //                       "size": "846.93 MB",
  //                       "size_bytes": 888070472,
  //                       "date_uploaded": "2020-05-16 14:12:55",
  //                       "date_uploaded_unix": 1589631175
  //                   },
  //                   {
  //                       "url": "https://yts.mx/torrent/download/24A0DFC6549591BF0C515ABAE0E8D2FDF8DC2C18",
  //                       "hash": "24A0DFC6549591BF0C515ABAE0E8D2FDF8DC2C18",
  //                       "quality": "1080p",
  //                       "type": "web",
  //                       "seeds": 0,
  //                       "peers": 0,
  //                       "size": "1.53 GB",
  //                       "size_bytes": 1642824991,
  //                       "date_uploaded": "2020-05-16 16:41:19",
  //                       "date_uploaded_unix": 1589640079
  //                   }
  //               ],
  //               "date_uploaded": "2020-05-16 14:12:55",
  //               "date_uploaded_unix": 1589631175
  //           },
}