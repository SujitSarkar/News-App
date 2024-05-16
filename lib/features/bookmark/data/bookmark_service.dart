import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/firebase_db_collection.dart';
import '../../../shared/data/data_sources/local/connectivity_service.dart';
import '../../../shared/utils/app_toast.dart';
import '../../news/domain/model/news_model.dart';
import '../domain/repository/bookmark_repository.dart';

class BookmarkService implements BookmarkRepository {
  BookmarkService._privateConstructor();
  static final BookmarkService instance = BookmarkService._privateConstructor();
  factory BookmarkService() => instance;

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<QuerySnapshot> getBookmarks() {
    final String userId = _auth.currentUser!.uid;
    return _firestore
        .collection(FirebaseDbCollection.user)
        .doc(userId)
        .collection(FirebaseDbCollection.bookmark)
        .orderBy("publishedAt", descending: true)
        .snapshots();
  }

  @override
  Future<bool> saveBookmark({required NewsModel newsModel}) async {
    final String userId = _auth.currentUser!.uid;
    final online = await CennectivityService.instance.isOnline();
    if (online == false) {
      showToast('No internet connection');
      return false;
    }
    try {
      await _firestore
          .collection(FirebaseDbCollection.user)
          .doc(userId)
          .collection(FirebaseDbCollection.bookmark)
          .add(newsModel.toMap());
      return true;
    } catch (error) {
      debugPrint(error.toString());
      showToast(error.toString());
      return false;
    }
  }

  @override
  Future<bool> isBookmarkExists({required String urlToImage}) async {
    final String userId = _auth.currentUser!.uid;
    final online = await CennectivityService.instance.isOnline();
    if (online == false) {
      showToast('No internet connection');
      return false;
    }
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection(FirebaseDbCollection.user)
          .doc(userId)
          .collection(FirebaseDbCollection.bookmark)
          .where('urlToImage', isEqualTo: urlToImage)
          .get();
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      debugPrint(e.toString());
      showToast(e.toString());
      return false;
    }
  }

  @override
  Future<bool> deleteBookmark({required String id}) async {
    final String userId = _auth.currentUser!.uid;
    final online = await CennectivityService.instance.isOnline();
    if (online == false) {
      showToast('No internet connection');
      return false;
    }
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection(FirebaseDbCollection.user)
          .doc(userId)
          .collection(FirebaseDbCollection.bookmark)
          .where('id', isEqualTo: id)
          .get();
      final batch = FirebaseFirestore.instance.batch();
      for (var doc in querySnapshot.docs) {
        batch.delete(doc.reference);
      }
      await batch.commit();
      return true;
    } catch (e) {
      debugPrint(e.toString());
      showToast(e.toString());
      return false;
    }
  }
}
