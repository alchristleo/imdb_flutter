import 'package:shared/src/redux/movies/movie_list_state.dart';
import 'package:shared/src/redux/movies/movie_list_actions.dart';
import 'package:shared/src/models/loading.dart';

MovieListState movieListReducer(MovieListState state, dynamic action) {
    if (action is FetchMovieListAction) {
        return state.copyWith(loadingStatus: LoadingStatus.loading);
    } else if (action is GetMovieListSuccessAction) {
        final newMovieList = state.movieList.toList();
        return state.copyWith(
            loadingStatus: LoadingStatus.success,
            movieList: newMovieList,
        );
    } else if (action is GetMovieListErrorAction) {
        return state.copyWith(loadingStatus: LoadingStatus.error);
    }

    return state;
}
