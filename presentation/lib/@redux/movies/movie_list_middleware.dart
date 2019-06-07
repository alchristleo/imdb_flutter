import 'dart:async';
import 'package:redux/redux.dart';
import 'package:imdb_flutter/@models/loading.dart';
import 'package:imdb_flutter/@models/movie_list.dart';
import 'package:imdb_flutter/@redux/movies/movie_list_actions.dart';
import 'package:imdb_flutter/@redux/app/app_state.dart';
import 'package:imdb_flutter/@services/imdb/handler/movie_list_handler.dart';

class MovieListMiddleware extends MiddlewareClass<AppState> {
    MovieListMiddleware(this.api);

    final MovieListHandler api;

    @override
    Future<Null> call(
        Store<AppState> store, dynamic action, NextDispatcher next) async {
        next(action);

        if (action is CompletableAction) {
            await _updateMovieList(store, action, next);
            action.completer.complete();
        }

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
            var movieLists = await fetchMovieList(next);

            next(GetMovieListSuccessAction(movieLists));
        } catch (e) {
            next(GetMovieListErrorAction());
        }
    }

    Future<List<MovieList>> fetchMovieList(NextDispatcher next) async {
        final movieLists = await api.getMovieList();

        return movieLists;
    }
}
