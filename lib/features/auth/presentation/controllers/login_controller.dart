import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/router/router_imports.dart';
import '../../../../shared/utils/app_toast.dart';
import '../../../account/presentation/controllers/account_controller.dart';
import '../../data/auth_service.dart';

class LoginController extends GetxController {
  LoginController(this._authService);
  final AuthService _authService;

  RxBool isLoading = false.obs;

  final GlobalKey<FormState> loginFormKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void clearData() {
    emailController.clear();
    passwordController.clear();
  }

  Future<void> userLogin(BuildContext context) async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    }
    isLoading(true);
    await _authService
        .login(
            email: emailController.text.trim(),
            password: passwordController.text)
        .then((credential) {
      if (credential != null) {
        showToast('Successfully logged in');
        clearData();
        updateUserInfo();
        popScreen();
      }
    });
    isLoading(false);
  }

  void updateUserInfo() {
    final AccountController accountController = Get.find();
    accountController.initialize();
  }
}
