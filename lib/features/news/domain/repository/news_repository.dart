import '../model/news_model.dart';

abstract class NewsRepository {
  Future<List<NewsModel>?> getNews();
}
