import 'dart:convert';

import 'package:peliculas_app/models/movie.dart';

class TopRate {
  TopRate({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  factory TopRate.fromJson(String str) => TopRate.fromMap(json.decode(str));

  factory TopRate.fromMap(Map<String, dynamic> json) => TopRate(
        page: json["page"] == null ? null : json["page"],
        results: json["results"] == null
            ? null
            : List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        totalResults:
            json["total_results"] == null ? null : json["total_results"],
      );
}
