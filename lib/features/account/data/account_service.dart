import '../../../core/constants/firebase_db_collection.dart';
import '../domain/repository/account_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../domain/model/user_model.dart';

class AccountService implements AccountRepository {
  AccountService._privateConstructor();
  static final AccountService instance = AccountService._privateConstructor();

  factory AccountService() => instance;

  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserModel?> getCurrentUser() async {
    try {
      final String currentUserId = _firebaseAuth.currentUser!.uid;
      DocumentReference<Map<String, dynamic>> userRef = FirebaseFirestore
          .instance
          .collection(FirebaseDbCollection.user)
          .doc(currentUserId);
      DocumentSnapshot<Map<String, dynamic>> userSnapshot = await userRef.get();

      final Map<String, dynamic> userData = userSnapshot.data()!;

      final user = UserModel(
        id: userData['id'],
        name: userData['name'],
        email: userData['email'],
      );
      return user;
    } catch (e) {
      return null;
    }
  }
}
