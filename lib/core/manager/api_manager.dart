import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:tt_tmdb_dcombier/core/model/movie.dart';

class ApiManager {
  static final ApiManager _instance = ApiManager._internal();

  factory ApiManager() => _instance;

  late Dio dio;

  ApiManager._internal() {
    dio = Dio();
  }

  String url =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=fa505febaac48c0da2ac1e85b2caeb49&language=fr-FR";
  List<Movie>? movies;

  List<Movie>? parseMovies(Map<String, dynamic> json) {
    if (json == null) return null;

    List<dynamic> data = json["results"];
    print(data[0]["results"]);
    List<dynamic> jsonArray = data;
    return jsonArray.map<Movie>((json) => Movie.fromJson(json)).toList();
  }

  Future<List<Movie>?> loadMovies() async {
    try {
      var response = await Dio().get(url);
      debugPrint("get : $response");

      var moviesDecode = jsonDecode(response.toString());
      debugPrint("decode : $moviesDecode");

      movies = parseMovies(moviesDecode);
      debugPrint("parse : ${movies.toString()}");

      return movies;
    } catch (error) {
      debugPrint("Erreur : $error");
      return null;
    }
  }
}
