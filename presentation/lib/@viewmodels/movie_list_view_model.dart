import 'package:imdb_flutter/@models/loading.dart';
import 'package:imdb_flutter/@models/movie_list.dart';
import 'package:imdb_flutter/@redux/index.dart';
import 'package:meta/meta.dart';
import 'package:redux/redux.dart';

class MovieListPageViewModel {
    MovieListPageViewModel({
        @required this.status,
        @required this.movieLists,
        @required this.refreshMovieList,
    });

    final LoadingStatus status;
    final List<MovieList> movieLists;
    final Function refreshMovieList;

    static MovieListPageViewModel fromStore(Store<AppState> store) {
        return MovieListPageViewModel(
            status: store.state.movieListState.loadingStatus,
            movieLists: movieListsSelector(store.state),
            refreshMovieList: () => store.dispatch(RefreshMovieListAction()),
        );
    }

    @override
    bool operator ==(Object other) =>
        identical(this, other) ||
        other is MovieListPageViewModel &&
            runtimeType == other.runtimeType &&
            status == other.status &&
            movieLists == other.movieLists;

    @override
    int get hashCode =>
        status.hashCode ^ movieLists.hashCode;
}
