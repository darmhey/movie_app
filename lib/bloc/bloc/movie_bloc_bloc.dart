import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/api_client/api_client.dart';

part 'movie_bloc_event.dart';
part 'movie_bloc_state.dart';

class MovieBlocBloc extends Bloc<MovieBlocEvent, MovieBlocState> {
  final MovieRepository movieRepository;
  MovieBlocBloc({required this.movieRepository})
      : super(const MovieBlocState()) {
    on<FetchPopularEvent>((event, emit) async {
      emit(state.copyWith(status: MovieStatus.loading));
      try {
        final movie = await movieRepository.getMovie('popular');
        emit(state.copyWith(
          status: MovieStatus.success,
          movie: movie.result,
        ));
      } on Exception catch (e) {
        throw Exception(e);
      }
    });
    on<FetchNowPlayingEvent>((event, emit) async {
      try {
        final movie = await movieRepository.getMovie('now_playing');
        emit(state.copyWith(
          status: MovieStatus.success,
          movie: movie.result,
        ));
      } on Exception catch (e) {
        throw Exception(e);
      }
    });
    on<FetchTopRatedEvent>((event, emit) async {
      try {
        final movie = await movieRepository.getMovie('top_rated');
        emit(state.copyWith(
          status: MovieStatus.success,
          movie: movie.result,
        ));
      } on Exception catch (e) {
        throw Exception(e);
      }
    });
    on<FetchUpcomingEvent>((event, emit) async {
      try {
        final movie = await movieRepository.getMovie('upcoming');
        emit(state.copyWith(
          status: MovieStatus.success,
          movie: movie.result,
        ));
      } on Exception catch (e) {
        throw Exception(e);
      }
    });
  }

  // Future<MovieResponse> fetchMovie(String url) async {
  //   try {
  //     final movie = await movieRepository.getMovie(url);
  //     return

  //   } on Exception catch (e) {
  //     throw Exception(e);
  //   }
  // }
}


//  Future<void> _onPostFetched(
//     PostFetched event,
//     Emitter<PostState> emit,
//   ) async {
//     if (state.hasReachedMax) return;
//     try {
//       if (state.status == PostStatus.initial) {
//         final posts = await _fetchPosts();
//         return emit(state.copyWith(
//           status: PostStatus.success,
//           posts: posts,
//           hasReachedMax: false,
//         ));
//       }
//       final posts = await _fetchPosts(state.posts.length);
//       posts.isEmpty
//           ? emit(state.copyWith(hasReachedMax: true))
//           : emit(
//               state.copyWith(
//                 status: PostStatus.success,
//                 posts: List.of(state.posts)..addAll(posts),
//                 hasReachedMax: false,
//               ),
//             );
//     } catch (_) {
//       emit(state.copyWith(status: PostStatus.failure));
//     }
//   }

  // Future<List<Post>> _fetchPosts([int startIndex = 0]) async {
  //   final response = await httpClient.get(
  //     Uri.https(
  //       'jsonplaceholder.typicode.com',
  //       '/posts',
  //       <String, String>{'_start': '$startIndex', '_limit': '$_postLimit'},
  //     ),
  //   );
  //   if (response.statusCode == 200) {
  //     final body = json.decode(response.body) as List;
  //     return body.map((dynamic json) {
  //       return Post(
  //         id: json['id'] as int,
  //         title: json['title'] as String,
  //         body: json['body'] as String,
  //       );
  //     }).toList();
  //   }
  //   throw Exception('error fetching posts');
  // }

