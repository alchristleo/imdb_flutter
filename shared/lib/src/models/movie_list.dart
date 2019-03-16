class MovieList {
    MovieList({
        this.id,
        this.title,
        this.posterPath,
        this.popularity,
    });

    final int id;
    final String title;
    final String posterPath;
    final int popularity;

    @override
    bool operator == (Object other) =>
        identical(this, other) ||
        other is MovieList &&
            runtimeType == other.runtimeType &&
            id == other.id &&
            title == other.title &&
            posterPath == other.posterPath &&
            popularity == other.popularity;

    @override
    int get hashCode =>
        id.hashCode ^
        title.hashCode ^
        posterPath.hashCode ^
        popularity.hashCode;

    MovieList.fromJSON(Map<String, dynamic> jsonMap) :
        id = jsonMap['id'],
        title = jsonMap['title'],
        posterPath = jsonMap['posterPath'],
        popularity = jsonMap['popularity'];
}
