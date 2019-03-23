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
}
