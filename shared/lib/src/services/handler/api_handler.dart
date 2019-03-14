import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared/src/models/movie_list.dart';
import 'package:shared/src/services/imdb.dart';

// class APIHandler {
//     APIHandler(this.client);

//     final Client client;

//     Uri get kMovieListBaseURL => Uri.https('api.themoviedb.org/3/', '/discover/movie');

//     Future<KtList<MovieList>> getMovieList() async {
//         final response = await client.get(
//             kMovieListBaseURL
//             .replace(queryParameters: {
//                 'api_key': IMDBKey.apiKey,
//             })
//         );

//         return response.transform();
//     }
// }
Future<Stream<MovieList>> getMovieList() async {
    final queryParameters = {
        'api_key': IMDBKey.apiKey
    };
    final kMovieListBaseURL = Uri.https('https://api.themoviedb.org/3/', '/discover/movie', queryParameters);
    final client = new http.Client();
    final response = await client.send(
        http.Request('get', kMovieListBaseURL)
    );

    return response.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .expand((data) => (data as List))
        .map((data) => MovieList.fromJSON(data));
}

