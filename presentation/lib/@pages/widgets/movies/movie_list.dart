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

    @override
    void initState() {
        super.initState();
        _movieLists = widget.movieLists;
    }

    @override
    void didUpdateWidget(MovieListView oldWidget) {
        super.didUpdateWidget(oldWidget);

        if (oldWidget.status != widget.status) {
            if (widget.status == LoadingStatus.success) {
                Timer(
                    LoadingView.successContentAnimationDuration,
                    () => _movieLists = widget.movieLists,
                );
            }
        } else if (widget.status == LoadingStatus.success) {
            _movieLists = widget.movieLists;
        }
    }

    @override
    Widget build(BuildContext context) {

        return Scrollbar(
            key: MovieListView.contentKey,
            child: GridView.builder(
                padding: const EdgeInsets.all(5.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.15
                ),
                itemCount: _movieLists.length,
                itemBuilder: (BuildContext context, int index) {
                    final movieLists = _movieLists[index];
                    return MovieListViewTile(movieLists);
                },
            ),
        );
    }
}
