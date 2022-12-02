import 'package:tt_tmdb_dcombier/core/manager/api_manager.dart';

import '../../core/model/movie.dart';

class MovieManager {
  List<Movie>? movies;

  static final MovieManager _instance = MovieManager._internal();

  factory MovieManager() => _instance;

  MovieManager._internal();

  Future<List<Movie>?> loadMovie() async {
    movies = await ApiManager().loadMovies();

    return movies;
  }

  List<Movie>? getMovie() {
    return movies;
  }
}