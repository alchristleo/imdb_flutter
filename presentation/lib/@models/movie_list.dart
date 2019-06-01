import 'package:intl/intl.dart';

class MovieList {
    MovieList({
        this.id,
        this.title,
        this.posterPath,
        this.popularity,
        this.voteAverage,
        this.backdropPath,
        this.releaseDate
    });

    final String id, title, posterPath, popularity, voteAverage, backdropPath, releaseDate;

    factory MovieList.fromJSON(Map<String, dynamic> json) {
        var dateParser = DateTime.parse(json['release_date']);
        var dateFormatter = new DateFormat('yMMM');
        String finalDate = (dateFormatter.format(dateParser)).toString();
        return new MovieList(
            id: json['id'].toString(),
            title: json['title'].toString(),
            posterPath: json['poster_path'].toString(),
            popularity: json['popularity'].toString(),
            voteAverage: json['vote_average'].toString(),
            backdropPath: json['backdrop_path'].toString() ?? null,
            releaseDate: finalDate.replaceAll(',', ''),
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
        voteAverage == other.voteAverage &&
        backdropPath == other.backdropPath &&
        releaseDate == other.releaseDate;

    @override
    int get hashCode =>
        id.hashCode ^
        title.hashCode ^
        posterPath.hashCode ^
        popularity.hashCode ^
        voteAverage.hashCode ^
        backdropPath.hashCode ^
        releaseDate.hashCode;
}
