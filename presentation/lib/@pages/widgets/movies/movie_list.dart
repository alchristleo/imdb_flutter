import 'dart:async';
import 'package:flutter/material.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";
import 'package:imdb_flutter/@models/loading.dart';
import 'package:imdb_flutter/@global/colors.dart';
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
    RefreshController _refreshController;

    @override
    void initState() {
        _refreshController = new RefreshController();
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

    Widget _headerCreate(BuildContext context, int mode) {
        return new ClassicIndicator(
            mode: mode,
            refreshingIcon: CircularProgressIndicator(
                strokeWidth: 4.0,
                backgroundColor: colorGrayscale10,
                valueColor: AlwaysStoppedAnimation<Color>(colorGrayscale10),
            ),
            refreshingText: "Refreshing...",
            idleIcon: Icon(Icons.arrow_upward, color: colorGrayscale10),
            idleText: "Refreshing...",
            releaseText: "Refreshing...",
            releaseIcon: Icon(Icons.arrow_upward, color: colorGrayscale10),
        );
    }

    @override
    Widget build(BuildContext context) {
        void _onRefresh(bool up) {
            if (up)
                new Future.delayed(const Duration(milliseconds: 2009)).then((val) {
                    _refreshController.sendBack(true, RefreshStatus.completed);
            //                refresher.sendStatus(RefreshStatus.completed);
                });
            else {
                new Future.delayed(const Duration(milliseconds: 2009)).then((val) {

                });
            }
        }

        return Scrollbar(
            key: MovieListView.contentKey,
            child: new SmartRefresher(
                controller: _refreshController,
                enablePullDown: true,
                onRefresh: _onRefresh,
                headerBuilder: _headerCreate,
                child: GridView.builder(
                    physics: ScrollPhysics(),
                    padding: const EdgeInsets.all(5.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.15,
                    ),
                    itemCount: _movieLists.length,
                    itemBuilder: (BuildContext context, int index) {
                        final movieLists = _movieLists[index];
                        return MovieListViewTile(movieLists);
                    },
                )
            ),
        );
    }
}
