
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
  final List torrents;

  Movie(this.id, this.url, this.imdbcode, this.title, this.titlelong, this.year, this.rating, this.runtime, this.genres, this.summary, this.yttrailercode, this.language, this.mparating, this.largecoverimage, this.torrents);

  
  // factory Movie.fromJson(Map<String, dynamic> json) {
  //   return Movie(
  //     albumId: json['albumId'] as int,
  //     id: json['id'] as int,
  //     title: json['title'] as String,
  //     url: json['url'] as String,
  //     thumbnailUrl: json['thumbnailUrl'] as String,
  //   );
  // }
}