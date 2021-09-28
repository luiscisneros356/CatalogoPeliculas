import 'dart:convert';

class Movie {
  Movie({
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  String? backdropPath;
  List<int> genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  get fullposter {
    if (posterPath != null) {
      return "https://image.tmdb.org/t/p/w500$posterPath";
    }

    return "https://i.stack.imgur.com/GNhxO.png";
  }

  get fullbackdropPath {
    if (backdropPath != null) {
      return "https://image.tmdb.org/t/p/w500$backdropPath";
    }
    return "https://i.stack.imgur.com/GNhxO.png";
  }

  factory Movie.fromJson(String str) => Movie.fromMap(json.decode(str));

  factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        backdropPath:
            json["backdrop_path"] == null ? null : json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"] == null
            ? null
            : json["original_language"],
        originalTitle:
            json["original_title"] == null ? null : json["original_title"],
        overview: json["overview"] == null ? null : json["overview"],
        popularity: json["popularity"].toDouble() == null
            ? null
            : json["popularity"].toDouble(),
        posterPath: json["poster_path"] == null ? null : json["poster_path"],
        releaseDate: json["release_date"] == null ? null : json["release_date"],
        title: json["title"] == null ? null : json["title"],
        video: json["video"] == null ? null : json["video"],
        voteAverage: json["vote_average"].toDouble() == null
            ? null
            : json["vote_average"].toDouble(),
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
      );
}
