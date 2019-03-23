import 'package:imdb_flutter/@redux/movies/movie_list_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
    AppState({
        @required this.movieListState,
    });

    final MovieListState movieListState;

    factory AppState.initial() {
        return AppState(
            movieListState: MovieListState.initial(),
        );
    }

    AppState copyWith({
        MovieListState movieListState,
    }) {
        return AppState(
            movieListState: movieListState ?? this.movieListState,
        );
    }

    @override
    bool operator == (Object other) =>
        identical(this, other) ||
        other is AppState &&
            runtimeType == other.runtimeType &&
            movieListState == other.movieListState;

    @override
    int get hashCode => movieListState.hashCode;
}
