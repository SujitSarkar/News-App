import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../account/domain/model/user_model.dart';

abstract class AuthRepository {
  Future<UserCredential?> login(
      {required String email, required String password});

  Future<UserCredential?> signup(
      {required String email, required String password});

  Future<bool> saveUser({required UserModel userModel});

  Future<bool> logout(BuildContext context);
}
