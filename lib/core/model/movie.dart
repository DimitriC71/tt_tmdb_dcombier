import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable(checked: true, explicitToJson: true)
class Movie {

  int? id;
  String? poster_path;
  String? title;
  String? release_date;
  String? overview;

  Movie({
    this.id,
    this.overview,
    this.poster_path,
    this.release_date,
    this.title,});

  factory Movie.fromJson(Map<String, dynamic> json) =>
      _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}