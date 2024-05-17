part of 'screen_imports.dart';

class Signupcreen extends StatelessWidget {
  const Signupcreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      init: SignupController(AuthService()),
      builder: (controller) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: controller.signupFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  Bouncy(
                      duration: const Duration(milliseconds: 2000),
                      lift: 20,
                      ratio: 0.5,
                      pause: 0.5,
                      child: const Icon(
                        FeatherIcons.user,
                        size: 100,
                        color: AppColors.primaryColor,
                      )),
                  const Text(
                    "Create new account to start your journey",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: AppColors.primaryColor, fontSize: 24),
                  ),
                  const SizedBox(height: 40),
                  TextFormFieldWidget(
                    controller: controller.nameController,
                    hintText: "Full name",
                    textCapitalization: TextCapitalization.words,
                    required: true,
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
                  const SizedBox(height: 16),
                  TextFormFieldWidget(
                    controller: controller.confirmPasswordController,
                    hintText: "Confirm password",
                    textInputType: TextInputType.visiblePassword,
                    required: true,
                    obscure: true,
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => SolidButton(
                        onTap: () => controller.userSignup(context),
                        isLoading: controller.isLoading.value,
                        child: const Text(
                          'Signup',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                  ),
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium,
                      children: [
                        const TextSpan(text: 'Already have an account? '),
                        TextSpan(
                          text: 'Login',
                          style: const TextStyle(
                              color: AppColors.secondaryColor,
                              fontWeight: FontWeight.w700),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              popScreen();
                            },
                        ),
                      ],
                    ),
                  ).paddingOnly(top: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
