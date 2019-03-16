import 'dart:async';
import 'package:redux/redux.dart';
import 'package:shared/src/models/loading.dart';
import 'package:shared/src/models/movie_list.dart';
import 'package:shared/src/redux/movies/movie_list_actions.dart';
import 'package:shared/src/redux/app/app_state.dart';
import 'package:shared/src/services/handler/api_handler.dart';


class MovieListMiddleware extends MiddlewareClass<AppState> {
    MovieListMiddleware(this.api);

    final APIHandler api;

    @override
    Future<Null> call(
        Store<AppState> store, dynamic action, NextDispatcher next) async {
        next(action);

        if (action is RefreshMovieListAction) {
            await _updateMovieList(store, action, next);
        }

        if (action is FetchMovieListIfNotLoadedAction) {
            if (store.state.movieListState.loadingStatus == LoadingStatus.idle) {
                await _updateMovieList(store, action, next);
            }
        }
    }

    Future<void> _updateMovieList(
        Store<AppState> store, dynamic action, NextDispatcher next) async {
        next(FetchMovieListAction());

        try {
            var movieList = Stream.empty();
            if (movieList == null) {
                movieList = await fetchMovieList(next);
            }

            next(GetMovieListSuccessAction(movieList));
        } catch (e) {
            next(GetMovieListErrorAction());
        }
    }

    Future<Stream<MovieList>> fetchMovieList(NextDispatcher next) async {
        final movieList = await api.getMovieList();

        return movieList;
    }
}
