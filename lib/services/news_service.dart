import 'dart:convert';

import 'package:news_app/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsService {
  static const baseUrl = 'https://api.themoviedb.org/3/trending/movie/day';
  final String apiKey = 'd454c26e64188593cde2629856fad639';
  static const imagePath = 'https://image.tmdb.org/t/p/w500';

  Future<List<News>> getTrendingMovies() async {
    final response = await http.get(Uri.parse('$baseUrl?api_key=$apiKey'));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body); //['results'] as List;
      print(decodedData);
      return (decodedData['results'] as List<dynamic>)
          .map((news) => News.fromJson(news))
          .toList();
    } else {
      throw Exception('Error');
    }
  }
}
