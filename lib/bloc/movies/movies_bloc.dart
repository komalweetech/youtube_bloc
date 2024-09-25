import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:youyube_bloc/models/movies/movies.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesBloc()) {
    on<MoviesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
