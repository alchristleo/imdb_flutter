import 'package:imdb_flutter/@redux/movies/movie_list_state.dart';
import 'package:imdb_flutter/@redux/movies/movie_list_actions.dart';
import 'package:imdb_flutter/@models/loading.dart';

MovieListState movieListReducer(MovieListState state, dynamic action) {
    if (action is FetchMovieListAction) {
        return state.copyWith(loadingStatus: LoadingStatus.loading);
    } else if (action is GetMovieListSuccessAction) {
        final newMovieLists = action.movieLists.toList();
        return state.copyWith(
            loadingStatus: LoadingStatus.success,
            movieLists: newMovieLists,
        );
    } else if (action is GetMovieListErrorAction) {
        return state.copyWith(loadingStatus: LoadingStatus.error);
    }

    return state;
}
