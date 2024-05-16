import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../../../../shared/utils/app_toast.dart';
import '../../data/bookmark_service.dart';

class BookmarkController extends GetxController {
  BookmarkController(this._bookmarkService);
  final BookmarkService _bookmarkService;

  Stream<QuerySnapshot> getBookmarks() {
    return _bookmarkService.getBookmarks();
  }

  Future<void> removeBookmark({required String id}) async {
    await _bookmarkService.deleteBookmark(id: id).then((value) {
      if (value) {
        showToast('News removed');
      }
    });
  }
}
