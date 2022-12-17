import 'package:dio/dio.dart';
import 'package:movie_app/api_client/src/models/models.dart';

class APIrequestFailure implements Exception {}

class MovieRepository {
  late final Dio _dio;
  static const baseUrl = "https://api.themoviedb.org/3/movie/";
  final String apiKey = 'ce3da44a232edc8e85c7ad3ff7cc1929';

  MovieRepository() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));
    initializeInterceptors();
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (request, handler) {
        // ignore: avoid_print
        print("${request.method} ${request.baseUrl}${request.path}");
        return handler.next(request);
      },
      onResponse: (response, handler) {
        // ignore: avoid_print
        print("${response.data}");
        return handler.next(response);
      },
      onError: (error, handler) {
        // ignore: avoid_print, unnecessary_string_interpolations
        print("${error.message}");
        return handler.next(error);
      },
    ));
  }

  Future<MovieResponse> getMovie(String categoryUrl) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      var response =
          await _dio.get('$baseUrl$categoryUrl', queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }

  Future<CastResponse> getCasts(int movieId) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      var response =
          await _dio.get("$baseUrl$movieId/credits", queryParameters: params);
      return CastResponse.fromJson(response.data);
    } on DioError {
      throw APIrequestFailure;
    }
  }

  Future<SimilarResponse> getSimilar(int movieId) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      var response =
          await _dio.get("$baseUrl$movieId/similar", queryParameters: params);
      return SimilarResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
