part of 'movie_bloc_bloc.dart';

abstract class MovieBlocEvent extends Equatable {
  const MovieBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchPopularEvent extends MovieBlocEvent {
  const FetchPopularEvent();

  @override
  List<Object> get props => [];
}

class FetchNowPlayingEvent extends MovieBlocEvent {
  const FetchNowPlayingEvent();

  @override
  List<Object> get props => [];
}

class FetchTopRatedEvent extends MovieBlocEvent {
  const FetchTopRatedEvent();

  @override
  List<Object> get props => [];
}

class FetchUpcomingEvent extends MovieBlocEvent {
  const FetchUpcomingEvent();

  @override
  List<Object> get props => [];
}

class FetchCastsEvent extends MovieBlocEvent {
  const FetchCastsEvent();

  @override
  List<Object> get props => [];
}

class FetchSimilarsEvent extends MovieBlocEvent {
  const FetchSimilarsEvent();

  @override
  List<Object> get props => [];
}
