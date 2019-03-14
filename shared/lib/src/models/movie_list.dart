class MovieList {
    final int id;
    final String title;
    final String posterPath;
    final int popularity;

    MovieList.fromJSON(Map<String, dynamic> jsonMap) :
        id = jsonMap['id'],
        title = jsonMap['title'],
        posterPath = jsonMap['posterPath'],
        popularity = jsonMap['popularity'];
}
