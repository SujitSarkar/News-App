import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/router/router_imports.dart';
import '../../../../shared/widgets/widgets_imports.dart';
import '../../data/auth_service.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(AuthService()),
        builder: (controller) {
          return Scaffold(
            body: Center(
              child: Form(
                key: controller.loginFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Login to Bookmark News',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.primaryColor, fontSize: 24),
                    ),
                    const SizedBox(height: 16),
                    TextFormFieldWidget(
                      controller: controller.emailController,
                      hintText: "Email address",
                      textInputType: TextInputType.emailAddress,
                      required: true,
                    ),
                    const SizedBox(height: 16),
                    TextFormFieldWidget(
                      controller: controller.passwordController,
                      hintText: "Password",
                      textInputType: TextInputType.visiblePassword,
                      required: true,
                      obscure: true,
                    ),
                    const SizedBox(height: 20),
                    Obx(() => SolidButton(
                        onTap: () {
                          controller.userLogin(context);
                        },
                        isLoading: controller.isLoading.value,
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ))),
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          const TextSpan(text: 'Don\'t have an account? '),
                          TextSpan(
                            text: 'Signup',
                            style: const TextStyle(
                                color: AppColors.secondaryColor,
                                fontWeight: FontWeight.w700),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                pushTo(AppRouter.signup);
                              },
                          ),
                        ],
                      ),
                    ).paddingOnly(top: 16),
                  ],
                ).paddingAll(16),
              ),
            ),
          );
        });
  }
}
