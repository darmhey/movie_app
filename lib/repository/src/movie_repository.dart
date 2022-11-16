import 'package:movie_app/api_client/api_client.dart';
import 'package:movie_app/repository/src/model/model.dart';

class MovieFailure implements Exception {}

class MovieRepository {
  final MovieApiClient _movieApiClient;

  MovieRepository(
    MovieApiClient? movieApiClient,
  ) : _movieApiClient = movieApiClient ?? MovieApiClient();

  Future<MovieDetails> getMovieDetails(String category) async {
    final movie = await _movieApiClient.getMovie(category);
    final movieId = movie.result.movieId;
    final similar = await _movieApiClient.getSimilar(movieId);
    final casts = await _movieApiClient.getCasts(movieId);
    return MovieDetails(
      similar: similar,
      casts: casts,
      movie: movie,
    );
  }
}



// extension on WeatherState {
//   WeatherCondition get toCondition {
//     switch (this) {
//       case WeatherState.clear:
//         return WeatherCondition.clear;
//       case WeatherState.snow:
//       case WeatherState.sleet:
//       case WeatherState.hail:
//         return WeatherCondition.snowy;
//       case WeatherState.thunderstorm:
//       case WeatherState.heavyRain:
//       case WeatherState.lightRain:
//       case WeatherState.showers:
//         return WeatherCondition.rainy;
//       case WeatherState.heavyCloud:
//       case WeatherState.lightCloud:
//         return WeatherCondition.cloudy;
//       default:
//         return WeatherCondition.unknown;
//     }
//   }
// }

// extension MovieTypeExtension on MoviesType {
//   String get value => toString().split('.').last;
//   String get name {
//     String name;
//     switch (this) {
//       case MoviesType.popular:
//         name = "Popular";
//         break;
//       case MoviesType.latest:
//         name = "Latest";
//         break;
//       case MoviesType.now_playing:
//         name = "Now Playing";
//         break;
//       case MoviesType.top_rated:
//         name = "Top rated";
//         break;
//       case MoviesType.upcoming:
//         name = "Upcoming";
//         break;
//     }
//     return name;
//   }
// }


