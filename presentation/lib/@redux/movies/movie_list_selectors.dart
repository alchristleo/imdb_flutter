import 'package:imdb_flutter/@models/movie_list.dart';
import 'package:imdb_flutter/@redux/app/app_state.dart';
import 'package:reselect/reselect.dart';

final movieListsSelector = createSelector1<AppState, List<MovieList>, List<MovieList>>(
    (state) => state.movieListState.movieLists,
    (List<MovieList> movieLists) {
        return movieLists;
    },
);
