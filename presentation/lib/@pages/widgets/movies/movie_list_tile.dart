import 'package:imdb_flutter/@global/colors.dart';
import 'package:imdb_flutter/@models/movie_list.dart';
import 'package:flutter/material.dart';

class MovieListViewTile extends StatelessWidget {
    MovieListViewTile(
        this.movieLists
    );

    final MovieList movieLists;

    @override
    Widget build(BuildContext context) {
        return Column(
            children: <Widget>[
                new Padding(
                    padding: const EdgeInsets.only(top: 1.0),
                    child: new Row(
                        children: <Widget>[
                            _DetailedInfo(movieLists)
                        ],
                    ),
                )
            ],
        );
    }
}

class _DetailedInfo extends StatelessWidget {
    _DetailedInfo(this.movieLists);
    final MovieList movieLists;

    @override
    Widget build(BuildContext context) {
        return Expanded(
            child: Container(
                margin: const EdgeInsets.all(2.0),
                child: new Card(
                    elevation: 1.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: colorBlackGradient92,
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            AspectRatio(
                                aspectRatio: 16.0 / 9.0,
                                child: new ClipRRect(
                                    borderRadius: new BorderRadius.only(
                                        topLeft: const Radius.circular(10.0),
                                        topRight: const Radius.circular(10.0)
                                    ),
                                    child: Image.network(
                                        Uri.https("image.tmdb.org", "/t/p/w500${movieLists.backdropPath}").toString(),
                                        fit: BoxFit.cover,
                                    )
                                ),
                            ),
                            new Padding(
                                padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                                child: new Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                        new Text(
                                            movieLists.title,
                                            overflow: TextOverflow.ellipsis,
                                        ),
                                    ],
                                )
                            ),
                            new Padding(
                                padding: const EdgeInsets.only(left: 20.0, top: 5.0, bottom: 5.0),
                                child: new Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                        new Icon(
                                            Icons.star,
                                            size: 16.0,
                                            color: colorDarkYellow,
                                        ),
                                        new Text(
                                            movieLists.voteAverage,

                                        ),
                                    ],
                                )
                            ),
                        ],
                    )
                ),
            ),
        );
    }
}
