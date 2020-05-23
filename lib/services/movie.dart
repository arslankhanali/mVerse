import 'package:mVerse/services/torrent.dart';

class Movie {
    int id;
    String url;
    String imdbCode;
    String title;
    String titleEnglish;
    String titleLong;
    String slug;
    int year;
    double rating;
    int runtime;
    List<String> genres;
    String summary;
    String descriptionFull;
    String synopsis;
    String ytTrailerCode;
    String language;
    String mpaRating;
    String backgroundImage;
    String backgroundImageOriginal;
    String smallCoverImage;
    String mediumCoverImage;
    String largeCoverImage;
    String state;
    List<Torrent> torrents;
    DateTime dateUploaded;
    int dateUploadedUnix;

    Movie({
        this.id,
        this.url,
        this.imdbCode,
        this.title,
        this.titleEnglish,
        this.titleLong,
        this.slug,
        this.year,
        this.rating,
        this.runtime,
        this.genres,
        this.summary,
        this.descriptionFull,
        this.synopsis,
        this.ytTrailerCode,
        this.language,
        this.mpaRating,
        this.backgroundImage,
        this.backgroundImageOriginal,
        this.smallCoverImage,
        this.mediumCoverImage,
        this.largeCoverImage,
        this.state,
        this.torrents,
        this.dateUploaded,
        this.dateUploadedUnix,
    });

    // factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

    // String toRawJson() => json.encode(toJson());

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"] == null ? null : json["id"],
        url: json["url"] == null ? null : json["url"],
        imdbCode: json["imdb_code"] == null ? null : json["imdb_code"],
        title: json["title"] == null ? null : json["title"],
        titleEnglish: json["title_english"] == null ? null : json["title_english"],
        titleLong: json["title_long"] == null ? null : json["title_long"],
        slug: json["slug"] == null ? null : json["slug"],
        year: json["year"] == null ? null : json["year"],
        rating: json["rating"] == null ? null : json["rating"].toDouble(),
        runtime: json["runtime"] == null ? null : json["runtime"],
        genres: json["genres"] == null ? null : List<String>.from(json["genres"].map((x) => x)),
        summary: json["summary"] == null ? null : json["summary"],
        descriptionFull: json["description_full"] == null ? null : json["description_full"],
        synopsis: json["synopsis"] == null ? null : json["synopsis"],
        ytTrailerCode: json["yt_trailer_code"] == null ? null : json["yt_trailer_code"],
        language: json["language"] == null ? null : json["language"],
        mpaRating: json["mpa_rating"] == null ? null : json["mpa_rating"],
        backgroundImage: json["background_image"] == null ? null : json["background_image"],
        backgroundImageOriginal: json["background_image_original"] == null ? null : json["background_image_original"],
        smallCoverImage: json["small_cover_image"] == null ? null : json["small_cover_image"],
        mediumCoverImage: json["medium_cover_image"] == null ? null : json["medium_cover_image"],
        largeCoverImage: json["large_cover_image"] == null ? null : json["large_cover_image"],
        state: json["state"] == null ? null : json["state"],
        torrents: json["torrents"] == null ? null : List<Torrent>.from(json["torrents"].map((x) => Torrent.fromJson(x))),
        dateUploaded: json["date_uploaded"] == null ? null : DateTime.parse(json["date_uploaded"]),
        dateUploadedUnix: json["date_uploaded_unix"] == null ? null : json["date_uploaded_unix"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "url": url == null ? null : url,
        "imdb_code": imdbCode == null ? null : imdbCode,
        "title": title == null ? null : title,
        "title_english": titleEnglish == null ? null : titleEnglish,
        "title_long": titleLong == null ? null : titleLong,
        "slug": slug == null ? null : slug,
        "year": year == null ? null : year,
        "rating": rating == null ? null : rating,
        "runtime": runtime == null ? null : runtime,
        "genres": genres == null ? null : List<dynamic>.from(genres.map((x) => x)),
        "summary": summary == null ? null : summary,
        "description_full": descriptionFull == null ? null : descriptionFull,
        "synopsis": synopsis == null ? null : synopsis,
        "yt_trailer_code": ytTrailerCode == null ? null : ytTrailerCode,
        "language": language == null ? null : language,
        "mpa_rating": mpaRating == null ? null : mpaRating,
        "background_image": backgroundImage == null ? null : backgroundImage,
        "background_image_original": backgroundImageOriginal == null ? null : backgroundImageOriginal,
        "small_cover_image": smallCoverImage == null ? null : smallCoverImage,
        "medium_cover_image": mediumCoverImage == null ? null : mediumCoverImage,
        "large_cover_image": largeCoverImage == null ? null : largeCoverImage,
        "state": state == null ? null : state,
        "torrents": torrents == null ? null : List<dynamic>.from(torrents.map((x) => x.toJson())),
        "date_uploaded": dateUploaded == null ? null : dateUploaded.toIso8601String(),
        "date_uploaded_unix": dateUploadedUnix == null ? null : dateUploadedUnix,
    };
}