// import 'dart:ffi';

class Movies {
  final String title;
  final String backdropPath;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String voteAverage;

  Movies(
      {required this.title,
      required this.backdropPath,
      required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.voteAverage});

  // connect JSON data to my appropriate properties
  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      title: json["original_title"],
      backdropPath: json["backdrop_path"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      voteAverage: json["vote_average"].toString(),
    );
  }
}
