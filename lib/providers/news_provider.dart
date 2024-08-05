import 'package:flutter/material.dart';
import 'package:news_app/services/news_service.dart';

class NewsProvider with ChangeNotifier {
  NewsService _newsService = NewsService();
  List<dynamic> _articles = [];
  bool _loading = false;

  List<dynamic> get articles => _articles;
  bool get loading => _loading;

  void fetchNews(String category) async {
    _loading = true;
    notifyListeners();
    try {
      _articles = await _newsService.fetchNews(category);
    } catch (e) {
      print(e); // Handle error accordingly
    }
    _loading = false;
    notifyListeners();
  }

  void searchNews(String query) async {
    _loading = true;
    notifyListeners();
    try {
      _articles = await _newsService.searchNews(query);
    } catch (e) {
      print(e); // Handle error accordingly
    }
    _loading = false;
    notifyListeners();
  }
}
