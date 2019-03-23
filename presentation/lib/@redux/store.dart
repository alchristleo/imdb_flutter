import 'package:redux/redux.dart';
import 'package:http/http.dart';
import 'package:imdb_flutter/@services/imdb/handler/api_handler.dart';
import 'package:imdb_flutter/@redux/app/app_reducer.dart';
import 'package:imdb_flutter/@redux/app/app_state.dart';
import 'package:imdb_flutter/@redux/movies/movie_list_middleware.dart';

Store<AppState> createStore(Client client) {
    final discoveryAPI = APIHandler(client);

    return Store(
        appReducer,
        initialState: AppState.initial(),
        distinct: true,
        middleware: [
            MovieListMiddleware(discoveryAPI)
        ],
    );
}
