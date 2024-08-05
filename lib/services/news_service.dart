import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsService {
  final String apiKey = 'pub_49517b88ab01758b4ee55cc4c9c44efdc32a2';
  final String baseUrl = 'https://newsdata.io/api/1/news';

  Future<List<dynamic>> fetchNews(String category) async {
    final response = await http.get(
      Uri.parse(
          '$baseUrl?apikey=$apiKey&country=in&language=en&category=$category'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['results'];
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<List<dynamic>> searchNews(String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl?apikey=$apiKey&q=$query&country=in&language=en'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['results'];
    } else {
      throw Exception('Failed to search news');
    }
  }
}
