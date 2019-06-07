import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:imdb_flutter/@models/movie_list.dart';
import 'package:imdb_flutter/@services/imdb/imdb.dart';

class MovieListHandler {
    static const String baseURL = "api.themoviedb.org";
    final _httpClient = new HttpClient();

    Future<List<MovieList>> getMovieList() async {
        var uri = Uri.https(
            baseURL,
            '/3/discover/movie',
            <String, String>{
                'api_key': IMDBKey.apiKey
            }
        );
        var response = await _getRequest(uri);
        var data = json.decode(response);
        await Future.delayed(const Duration(seconds: 1));

        return (data['results'] as List).
            map((listMovie) => MovieList.fromJSON(listMovie)).toList();
    }

    Future<String> _getRequest(Uri uri) async {
        var request = await _httpClient.getUrl(uri);
        var response = await request.close();

        return response.transform(utf8.decoder).join();
    }
}

