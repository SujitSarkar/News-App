import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../news/domain/model/news_model.dart';

abstract class BookmarkRepository {
  Stream<QuerySnapshot> getBookmarks();

  Future<bool> saveBookmark({required NewsModel newsModel});

  Future<bool> isBookmarkExists({required String urlToImage});

  Future<bool> deleteBookmark({required String id});
}
