import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app/models/credits.dart';
import 'package:peliculas_app/models/movie.dart';
import 'package:peliculas_app/models/now_playing.dart';

import 'package:peliculas_app/models/popular.dart';

import 'package:peliculas_app/models/top_rated.dart';

import 'package:peliculas_app/models/upcoming.dart';

class MovieProvider extends ChangeNotifier {
  String _apikey = "8437862ff95abdb0df214d552c071fd0";
  String _baseUrl = "api.themoviedb.org";
  String _language = "es-Es";

  List<Movie> displaymovie = [];
  List<Movie> displaypopular = [];
  List<Movie> displaytoprated = [];
  List<Movie> displayupcoming = [];
  List<Movie> displaysearchmovie = [];
  List<Movie> displayTvProgramEnElAire = [];
  int _page = 1;
  Map<int, List<Cast>> movieCast = {};

  MovieProvider() {
    getNowPlaying();
    getPopular();
    getTopRated();
    getUpcoming();
  }

  getNowPlaying() async {
    _page++;
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apikey, "language": _language, "page": "$_page"});

    final resp = await http.get(url);
    final nowPlayingMovie = NowPlayingMovie.fromJson(resp.body);

    displaymovie = nowPlayingMovie.results;

    notifyListeners();
  }

  getPopular() async {
    _page++;
    var url = Uri.https(_baseUrl, '3/movie/popular', {
      'api_key': _apikey,
      "language": _language,
      "page": "$_page",
    });
    final resp = await http.get(url);
    final popularmovies = MoviesPopular.fromJson(resp.body);

    displaypopular = popularmovies.results!;

    notifyListeners();
  }

  getTopRated() async {
    _page++;

    var url = Uri.https(_baseUrl, '3/movie/top_rated',
        {'api_key': _apikey, "language": _language, "page": "$_page"});
    final resp = await http.get(url);

    final topRated = TopRate.fromJson(resp.body);

    displaytoprated = topRated.results!;
    notifyListeners();
  }

  getUpcoming() async {
    if (_page < 4) _page++;

    var url = Uri.https(_baseUrl, '3/movie/upcoming', {
      'api_key': _apikey,
      "language": _language,
      "page": "$_page",
      "region": "US"
    });
    final resp = await http.get(url);

    final upComing = Upcoming.fromJson(resp.body);

    displayupcoming = upComing.results!;
    notifyListeners();
  }

  Future getMovieCast(int movieId) async {
    var url = Uri.https(_baseUrl, '3/movie/$movieId/credits', {
      'api_key': _apikey,
      "language": _language,
    });
    final resp = await http.get(url);
    final casting = Credits.fromJson(resp.body);

    movieCast[movieId] = casting.cast!;

    return casting.cast;
  }
}
