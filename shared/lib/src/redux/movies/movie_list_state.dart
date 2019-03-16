import 'package:shared/src/models/loading.dart';
import 'package:shared/src/models/movie_list.dart';
import 'package:meta/meta.dart';

@immutable
class MovieListState {
    MovieListState({
        @required this.loadingStatus,
        @required this.movieList,
    });

    final LoadingStatus loadingStatus;
    final List<MovieList> movieList;

    factory MovieListState.initial() {
        return MovieListState(
            loadingStatus: LoadingStatus.idle,
            movieList: List(),
        );
    }

    MovieListState copyWith({
        LoadingStatus loadingStatus,
        List<MovieList> movieList,
    }) {
        return MovieListState(
            loadingStatus: loadingStatus ?? this.loadingStatus,
            movieList: movieList ?? this.movieList,
        );
    }

    @override
    bool operator ==(Object other) =>
        identical(this, other) ||
        other is MovieListState &&
            runtimeType == other.runtimeType &&
            loadingStatus == other.loadingStatus &&
            movieList == other.movieList;

    @override
    int get hashCode =>
        loadingStatus.hashCode ^
        movieList.hashCode;
}
