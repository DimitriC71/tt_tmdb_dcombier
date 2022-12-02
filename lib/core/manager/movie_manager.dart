import 'package:tt_tmdb_dcombier/core/manager/api_manager.dart';

import '../../core/model/movie.dart';

class MovieManager {
  List<Movie>? movies;

  List<Movie> favoriteMovies = [];

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

  List<Movie>? getFavoriteMovies() {
    return favoriteMovies;
  }

  void favoriteCliked(Movie pMovie) {

    if(movies != null && favoriteMovies.contains(pMovie)) {
      favoriteMovies.remove(pMovie);
    } else {
      favoriteMovies.add(pMovie);
    }

    //Test pour résoudre bug de l'ajout de favori
    /*
    bool find = false;
    for(var favoriteMovie in favoriteMovies) {
      if (favoriteMovie.title == pMovie.title) {
        find = true;
      }
    }

    if(find) {
      favoriteMovies.remove(pMovie);
    } else {
      favoriteMovies.add(pMovie);
    }
    */
  }

  bool isFavorite(Movie pMovie) {
    if(movies != null && favoriteMovies!.contains(pMovie)) {
      return true;
    } else {
      return false;
    }
  }
}