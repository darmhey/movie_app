import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/repository/src/model/model.dart';

part 'movie_bloc_event.dart';
part 'movie_bloc_state.dart';

class MovieBlocBloc extends Bloc<MovieBlocEvent, MovieBlocState> {
  MovieBlocBloc() : super(MovieBlocState()) {
    on<FetchPopularEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FetchNowPlayingEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FetchTopRatedEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FetchUpcomingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
