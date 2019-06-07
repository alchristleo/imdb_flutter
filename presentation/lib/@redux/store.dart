import 'package:redux/redux.dart';
import 'package:imdb_flutter/@services/imdb/handler/movie_list_handler.dart';
import 'package:imdb_flutter/@redux/app/app_reducer.dart';
import 'package:imdb_flutter/@redux/app/app_state.dart';
import 'package:imdb_flutter/@redux/movies/movie_list_middleware.dart';

Store<AppState> createStore() {
    final movieListAPI = MovieListHandler();

    return Store(
        appReducer,
        initialState: AppState.initial(),
        distinct: true,
        middleware: [
            MovieListMiddleware(movieListAPI)
        ],
    );
}
