import 'dart:convert';

import 'package:peliculas_app/models/movie.dart';

class Upcoming {
  Upcoming({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  factory Upcoming.fromJson(String str) => Upcoming.fromMap(json.decode(str));

  factory Upcoming.fromMap(Map<String, dynamic> json) => Upcoming(
        page: json["page"] == null ? null : json["page"],
        results: json["results"] == null
            ? null
            : List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        totalResults:
            json["total_results"] == null ? null : json["total_results"],
      );
}
