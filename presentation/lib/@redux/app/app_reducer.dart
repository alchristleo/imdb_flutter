import 'package:imdb_flutter/@redux/app/app_state.dart';
import 'package:imdb_flutter/@redux/movies/movie_list_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
    return new AppState(
        movieListState: movieListReducer(state.movieListState, action)
    );
}
