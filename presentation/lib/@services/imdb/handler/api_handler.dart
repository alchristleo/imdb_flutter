import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:imdb_flutter/@models/movie_list.dart';
import 'package:imdb_flutter/@services/imdb/imdb.dart';

class APIHandler {
    APIHandler(this.client);
    final http.Client client;
    Uri get kMovieListBaseURL => Uri.https('api.themoviedb.org', '/3/discover/movie');

    Future<List<MovieList>> getMovieList() async {
        final response = await client.get(
            kMovieListBaseURL
            .replace(queryParameters: {
                'api_key': IMDBKey.apiKey,
            })
        );
        var movieListResult = json.decode(response.body);

        return (movieListResult['results'] as List)
            .map((data) => MovieList.fromJSON(data)).toList();

    }
}

