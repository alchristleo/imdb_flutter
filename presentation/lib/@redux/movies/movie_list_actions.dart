import 'dart:async';
import 'package:imdb_flutter/@models/movie_list.dart';

class InitAction {}

class CompletableAction {
    final Completer completer;

    CompletableAction({Completer completer})
        : this.completer = completer ?? new Completer();
}

class RefreshMovieListAction {}

class FetchMovieListIfNotLoadedAction {}

class FetchMovieListAction {}

class GetMovieListSuccessAction {
    GetMovieListSuccessAction(this.movieLists);
    final List<MovieList> movieLists;
}

class GetMovieListErrorAction {}
