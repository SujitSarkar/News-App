import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/app_color.dart';
import '../../../../shared/widgets/widget_imports.dart';
import '../controllers/account_controller.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final AccountController accountController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        centerTitle: true,
      ),
      body: Obx(
        () => accountController.isLoading.value
            ? const LoadingWidget()
            : accountController.isUserLoggedIn.value
                ? Center(
                    child: SizedBox(
                      width: kIsWeb ? 450 : double.infinity,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  AppColors.primaryColor.withOpacity(0.3),
                              radius: 50,
                              child: const Icon(
                                CupertinoIcons.person,
                                size: 60,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              accountController.userModel.value?.name ?? 'N/A',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              accountController.userModel.value?.email ?? 'N/A',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 16),
                            Obx(() => SizedBox(
                                  width: 120,
                                  child: SolidButton(
                                      onTap: () {
                                        accountController.logout(context);
                                      },
                                      isLoading: accountController
                                          .functionLoading.value,
                                      backgroundColor: AppColors.errorColor,
                                      child: Text(
                                        'Logout',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(color: Colors.white),
                                      )),
                                ))
                          ],
                        ),
                      ),
                    ),
                  )
                : const LogInRequiredWidget(),
      ),
    );
  }
}
