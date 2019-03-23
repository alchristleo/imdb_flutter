import 'package:imdb_flutter/@models/movie_list.dart';

class InitAction {}

class RefreshMovieListAction {}

class FetchMovieListIfNotLoadedAction {}

class FetchMovieListAction {}

class GetMovieListSuccessAction {
    GetMovieListSuccessAction(this.movieLists);
    final List<MovieList> movieLists;
}

class GetMovieListErrorAction {}
