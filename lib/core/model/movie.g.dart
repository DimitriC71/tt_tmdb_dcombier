// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Movie',
      json,
      ($checkedConvert) {
        final val = Movie(
          id: $checkedConvert('id', (v) => v as int?),
          overview: $checkedConvert('overview', (v) => v as String?),
          poster_path: $checkedConvert('poster_path', (v) => v as String?),
          release_date: $checkedConvert('release_date', (v) => v as String?),
          title: $checkedConvert('title', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'poster_path': instance.poster_path,
      'title': instance.title,
      'release_date': instance.release_date,
      'overview': instance.overview,
    };
