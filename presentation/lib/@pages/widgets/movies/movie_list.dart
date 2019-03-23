import 'dart:async';
import 'package:flutter/material.dart';
import 'package:imdb_flutter/@models/loading.dart';
import 'package:imdb_flutter/@models/movie_list.dart';
import 'package:imdb_flutter/@pages/widgets/loading/loading.dart';
import 'package:imdb_flutter/@pages/widgets/movies/movie_list_tile.dart';

class MovieListView extends StatefulWidget {
  static const Key emptyViewKey = Key('emptyView');
  static const Key contentKey = Key('content');

  MovieListView(this.status, this.movieLists);
  final LoadingStatus status;
  final List<MovieList> movieLists;

  @override
  _MovieListViewState createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  List<MovieList> _movieLists = List();
  bool _movieListEmptyView = false;

  @override
  void initState() {
    super.initState();
    _movieLists = widget.movieLists;
    _movieListEmptyView = widget.status == LoadingStatus.success;
  }

  @override
  void didUpdateWidget(MovieListView oldWidget) {
    super.didUpdateWidget(oldWidget);

    /// We do this dance here since we want to "freeze" the content until
    /// the [LoadingView] hides us completely.
    if (oldWidget.status != widget.status) {
      /// Loading status changed and shows got updated; update them after the
      /// animation finishes.
      if (widget.status == LoadingStatus.success) {
        Timer(
          LoadingView.successContentAnimationDuration,
          () => _movieLists = widget.movieLists,
        );
      }
    } else if (widget.status == LoadingStatus.success) {
      /// Loading status didn't change, so update the shows instantly.
      _movieLists = widget.movieLists;
    }

    _movieListEmptyView =
        widget.status == LoadingStatus.success;
  }

  @override
  Widget build(BuildContext context) {

    return Scrollbar(
      key: MovieListView.contentKey,
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 50.0),
        itemCount: _movieLists.length,
        itemBuilder: (BuildContext context, int index) {
          final movieLists = _movieLists[index];
          return MovieListViewTile(movieLists);
        },
      ),
    );
  }
}
