import 'package:dio/dio.dart';
import 'package:movie_app/api_client/src/models/models.dart';

class APIrequestFailure implements Exception {}

class MovieApiClient {
  final Dio _dio = Dio();
  static const baseUrl = "https://api.themoviedb.org/3/movie/";
  final String apiKey = 'ce3da44a232edc8e85c7ad3ff7cc1929';

  // var nowplayingUrl = '$baseUrl/movie/now_playing';
  // var popularUrl = '$baseUrl/movie/popular';
  // var topratedUrl = '$baseUrl/movie/top_rated';
  // var upcomingUrl = '$baseUrl/movie/upcoming';

  // var getOthers = '$baseUrl/movie';

  Future<MovieResponse> getMovie(String categoryUrl) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      var response =
          await _dio.get('$baseUrl + $categoryUrl', queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } on DioError {
      throw APIrequestFailure;
    }
  }

  // Future<MovieResponse> getPopular() async {
  //   var params = {"api_key": apiKey, "language": "en-US"};
  //   try {
  //     var response = await _dio.get(popularUrl, queryParameters: params);
  //     return MovieResponse.fromJson(response.data);
  //   } on DioError {
  //     throw APIrequestFailure;
  //   }
  // }

  // Future<MovieResponse> getTopRated() async {
  //   var params = {"api_key": apiKey, "language": "en-US"};
  //   try {
  //     var response = await _dio.get(topratedUrl, queryParameters: params);
  //     return MovieResponse.fromJson(response.data);
  //   } on DioError {
  //     throw APIrequestFailure;
  //   }
  // }

  // Future<MovieResponse> getUpcoming() async {
  //   var params = {"api_key": apiKey, "language": "en-US"};
  //   try {
  //     var response = await _dio.get(upcomingUrl, queryParameters: params);
  //     return MovieResponse.fromJson(response.data);
  //   } on DioError {
  //     throw APIrequestFailure;
  //   }
  // }

  Future<CastResponse> getCasts(int movieId) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      var response = await _dio.get("$baseUrl + $movieId + /credits",
          queryParameters: params);
      return CastResponse.fromJson(response.data);
    } on DioError {
      throw APIrequestFailure;
    }
  }

  Future<SimilarResponse> getSimilar(int movieId) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      var response = await _dio.get("$baseUrl + $movieId + /similar",
          queryParameters: params);
      return SimilarResponse.fromJson(response.data);
    } on DioError {
      throw APIrequestFailure;
    }
  }
}

// enum MovieCategory { nowPlaying, popular, topRated, upcoming }

// extension on MovieCategory {
//   Future<MovieResponse> get onCategory {
//     switch (this) {
//       case MovieCategory.nowPlaying:
//         return getMovie('now_playing');
//       case MovieCategory.popular:
//         return getMovie('popular');
//       case MovieCategory.topRated:
//         return getMovie('top_rated');
//       case MovieCategory.upcoming:
//         return getMovie('upcoming');
//     }
//   }
// }
