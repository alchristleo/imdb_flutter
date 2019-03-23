class MovieList {
    MovieList({
        this.id,
        this.title,
        this.posterPath,
        this.popularity
    });

    final String id, title, posterPath, popularity;

    factory MovieList.fromJSON(Map<String, dynamic> json) {
        return new MovieList(
            id: json['id'].toString(),
            title: json['title'].toString(),
            posterPath: json['poster_path'].toString(),
            popularity: json['popularity'].toString()
        );
    }

    @override
    bool operator ==(Object other) =>
        identical(this, other) || other is MovieList &&
        runtimeType == other.runtimeType &&
        id == other.id &&
        title == other.title &&
        posterPath == other.posterPath &&
        popularity == other.popularity;

    @override
    int get hashCode => id.hashCode ^ title.hashCode ^ posterPath.hashCode ^ popularity.hashCode;
}
