import 'package:shared/src/models/movie_list.dart';

class RefreshMovieListAction {}

class FetchMovieListIfNotLoadedAction {}

class FetchMovieListAction {}

class GetMovieListSuccessAction {
    final Stream<MovieList> movieList;

    GetMovieListSuccessAction(this.movieList);
}

class GetMovieListErrorAction {}
