import 'package:dio/dio.dart';
import 'package:movie_application/feature/_model/movie_model.dart';
import 'package:movie_application/feature/_model/results_model.dart';

class DioService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://moviesdatabase.p.rapidapi.com',
      headers: {
        'X-RapidAPI-Key': '0f1b21b9aamsh50dd7f87a1d6c3dp10247bjsn7a859a6d979d',
        'X-RapidAPI-Host': 'moviesdatabase.p.rapidapi.com',
      },
    ),
  );

  Future<MovieModel> fetchMovies({
    required String titleType,
    required String page,
    required int limit,
    required int year,
  }) async {
    try {
      final response = await _dio.get(
        '/titles',
        queryParameters: {
          'titleType': titleType,
          'page': page,
          'limit': limit,
          'year': year,
        },
      );
      print(response);
      return MovieModel.fromJson(response.data);
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future<Results> fetchMovieWithID({required String id}) async {
    try {
      final response = await _dio.get(
        "/titles/${id}",
      );
      print(response);
      return Results.fromJson(response.data["results"]);
    } catch (e) {
      throw Exception('$e');
    }
  }

  // Future<IMDB> fetchMovieIMDBWithID({required String id}) async {
  //   try {
  //     final response = await _dio.get(
  //       "titles/${id}/ratings",
  //     );
  //     return IMDB.fromJson(response.data);
  //   } catch (e) {
  //     throw Exception('$e');
  //   }
  // }

  Future<MovieModel> searchMovieWithName({
    required String name,
    required String page,
    required int limit,
  }) async {
    try {
      final response = await _dio.get(
        '/titles/search/title/${name}',
        queryParameters: {
          'titleType': 'movie',
          'page': page,
          'limit': limit,
          'exact': false
        },
      );
      print(response);
      return MovieModel.fromJson(response.data);
    } catch (e) {
      throw Exception('hatam : $e----');
    }
  }
}
