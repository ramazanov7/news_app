// import 'dart:ffi';

class News {
  final String title;
  final String backdropPath;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String voteAverage;

  News({
    required this.title,
    required this.backdropPath,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage
  });

  // connect JSON data to my appropriate properties 
  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json["original_title"], 
      backdropPath: json["backdrop_path"], 
      overview: json["overview"], 
      posterPath: json["poster_path"], 
      releaseDate: json["release_date"], 
      voteAverage: json["vote_average"].toString(),
    );
  }

}