import 'package:imdb_flutter/@models/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class MovieListViewTile extends StatelessWidget {
  MovieListViewTile(
    this.movieLists
  );

  final MovieList movieLists;

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 16.0,
      ),
      child: Row(
        children: [
          _DetailedInfo(movieLists),
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 1.0),
      child: Material(
        color: const Color(0xE00D1736),
        child: InkWell(
          child: content,
        ),
      ),
    );
  }
}

class _DetailedInfo extends StatelessWidget {
  _DetailedInfo(this.movieLists);
  final MovieList movieLists;

  @override
  Widget build(BuildContext context) {
    final decoration = const BoxDecoration(
      border: Border(
        left: BorderSide(
          color: Color(0xFF717DAD),
        ),
      ),
    );

    final content = [
      Text(
        movieLists.title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
          color: Color(0xFFFFFFFF),
        ),
      ),
      const SizedBox(height: 4.0)
    ];

    return Expanded(
      child: Container(
        decoration: decoration,
        margin: const EdgeInsets.only(left: 12.0),
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: content,
        ),
      ),
    );
  }
}
