import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../shared/utils/app_toast.dart';
import '../../../core/constants/firebase_db_collection.dart';
import '../../../shared/data/data_sources/local/connectivity_service.dart';
import '../../account/domain/model/user_model.dart';
import '../domain/repository/auth_repository.dart';

class AuthService implements AuthRepository {
  AuthService._privateConstructor();
  static final AuthService instance = AuthService._privateConstructor();

  factory AuthService() => instance;

  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<UserCredential?> login(
      {required String email, required String password}) async {
    final online = await CennectivityService.instance.isOnline();
    if (online == false) {
      showToast('No internet connection');
      return null;
    }
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        showToast("Invalid credentials");
      } else {
        showToast(e.message ?? "");
      }
    } catch (error) {
      showToast(error.toString());
    }
    return null;
  }

  @override
  Future<UserCredential?> signup(
      {required String email, required String password}) async {
    final online = await CennectivityService.instance.isOnline();
    if (online == false) {
      showToast('No internet connection');
      return null;
    }
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast('User already exist');
      } else {
        showToast(e.message ?? "Something went wrong");
      }
    } catch (error) {
      showToast(error.toString());
    }
    return null;
  }

  @override
  Future<bool> saveUser({required UserModel userModel}) async {
    final online = await CennectivityService.instance.isOnline();
    if (online == false) {
      showToast('No internet connection');
      return false;
    }
    try {
      await _firestore
          .collection(FirebaseDbCollection.user)
          .doc(userModel.id)
          .set(userModel.toMap());
      return true;
    } catch (error) {
      debugPrint(error.toString());
      showToast(error.toString());
      return false;
    }
  }

  @override
  Future<bool> logout(BuildContext context) async {
    final online = await CennectivityService.instance.isOnline();
    if (online == false) {
      showToast('No internet connection');
      return false;
    }
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (error) {
      debugPrint(error.toString());
      showToast(error.toString());
      return false;
    }
  }
}
