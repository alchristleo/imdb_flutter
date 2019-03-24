import 'package:imdb_flutter/@models/loading.dart';
import 'package:imdb_flutter/@models/movie_list.dart';
import 'package:meta/meta.dart';

@immutable
class MovieListState {
    MovieListState({
        @required this.loadingStatus,
        @required this.movieLists,
    });

    final LoadingStatus loadingStatus;
    final List<MovieList> movieLists;

    factory MovieListState.initial() {
        return MovieListState(
            loadingStatus: LoadingStatus.idle,
            movieLists: [],
        );
    }

    MovieListState copyWith({ LoadingStatus loadingStatus, List<MovieList> movieLists }) {
        return MovieListState(
            loadingStatus: loadingStatus ?? this.loadingStatus,
            movieLists: movieLists ?? this.movieLists,
        );
    }

    @override
    bool operator ==(Object other) =>
        identical(this, other) ||
        other is MovieListState &&
            runtimeType == other.runtimeType &&
            loadingStatus == other.loadingStatus;

    @override
    int get hashCode => loadingStatus.hashCode;
}
