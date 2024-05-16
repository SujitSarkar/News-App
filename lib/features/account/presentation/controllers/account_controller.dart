import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../features/account/domain/model/user_model.dart';
import '../../../auth/data/auth_service.dart';
import '../../data/account_service.dart';

class AccountController extends GetxController {
  AccountController(this._accountService);
  final AccountService _accountService;

  final GlobalKey<FormState> loginFormKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final RxBool isLoading = false.obs;
  final RxBool functionLoading = false.obs;
  final RxBool isUserLoggedIn = false.obs;
  final Rxn<UserModel> userModel = Rxn();

  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  void initialize() async {
    checkIsUserLoggedIn();
    getUser();
  }

  void checkIsUserLoggedIn() {
    if (FirebaseAuth.instance.currentUser != null) {
      isUserLoggedIn(true);
    } else {
      isUserLoggedIn(false);
    }
  }

  Future<void> getUser() async {
    if (isUserLoggedIn.value) {
      isLoading(true);
      await _accountService.getCurrentUser().then((value) {
        if (value != null) {
          userModel(value);
        }
      });
      isLoading(false);
    }
  }

  Future<void> logout(BuildContext context) async {
    functionLoading(true);
    await AuthService.instance.logout(context).then((value) {
      if (value) {
        isUserLoggedIn(false);
      }
    });
    functionLoading(false);
  }
}
