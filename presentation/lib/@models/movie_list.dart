class MovieList {
    MovieList({
        this.id,
        this.title,
        this.posterPath,
        this.popularity,
        this.voteAverage
    });

    final String id, title, posterPath, popularity, voteAverage;

    factory MovieList.fromJSON(Map<String, dynamic> json) {
        return new MovieList(
            id: json['id'].toString(),
            title: json['title'].toString(),
            posterPath: json['poster_path'].toString(),
            popularity: json['popularity'].toString(),
            voteAverage: json['vote_average'].toString()
        );
    }

    @override
    bool operator ==(Object other) =>
        identical(this, other) || other is MovieList &&
        runtimeType == other.runtimeType &&
        id == other.id &&
        title == other.title &&
        posterPath == other.posterPath &&
        popularity == other.popularity &&
        voteAverage == other.voteAverage;

    @override
    int get hashCode =>
        id.hashCode ^
        title.hashCode ^
        posterPath.hashCode ^
        popularity.hashCode ^
        voteAverage.hashCode;
}
