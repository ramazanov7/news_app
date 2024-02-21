// ignore_for_file: dead_code

import 'dart:convert';

import 'package:news_app/data/models/movies_model.dart';
import 'package:http/http.dart' as http;

class MovieService {
  static const baseUrl = 'https://api.themoviedb.org/3/trending/movie/day';
  final String apiKey = 'd454c26e64188593cde2629856fad639';
  static const imagePath = 'https://image.tmdb.org/t/p/w500';

  Future<List<Movies>> getMovies(int page) async {
    final response = await http.get(Uri.parse('$baseUrl?api_key=$apiKey'));

    // checking statusCode
    checkingStatusCode() {
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        return decodedData;
      } else {
        throw Exception('error');
      }
    }

    var data = checkingStatusCode();
    final Iterable results = await data['results'] as Iterable;
    List<Movies> movies = results
        .map((movie) => Movies.fromJson(movie as Map<String, dynamic>))
        .toList();
    List<Movies> movies2 = [];
    for (int i = 0; i < 10; i++) {
      movies2.add(movies[i]);
    }
    return movies;
  }
}
