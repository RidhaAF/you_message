import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_message/app/modules/auth/sign_in/sign_in_controller.dart';
import 'package:you_message/app/routes/app_routes.dart';
import 'package:you_message/app/utils/constants/app_constants.dart';
import 'package:you_message/app/widgets/default_button.dart';
import 'package:you_message/app/widgets/default_text_field.dart';
import 'package:you_message/app/widgets/default_spacer.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInController signInController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign In',
          textScaleFactor: 1.0,
        ),
        centerTitle: false,
      ),
      body: Form(
        key: signInController.formKey,
        child: ListView(
          padding: EdgeInsets.all(defaultMargin),
          children: [
            DefaultTextField(
              controller: signInController.emailCtrl.value,
              focusNode: signInController.emailFocus.value,
              labelText: 'Email',
              hintText: 'Enter your email',
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email is required';
                }
                return null;
              },
            ),
            DefaultSpacer(height: defaultMargin / 2),
            DefaultTextField(
              controller: signInController.passwordCtrl.value,
              focusNode: signInController.passwordFocus.value,
              labelText: 'Password',
              hintText: 'Enter your password',
              textInputAction: TextInputAction.next,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            const DefaultSpacer(),
            Obx(
              () => DefaultButton(
                isLoading: signInController.isLoading.value,
                onPressed: () => signInController.signIn(),
                text: 'Sign In',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account?',
                  style: TextStyle(
                    color: mutedColor,
                  ),
                  textScaleFactor: 1.0,
                ),
                TextButton(
                  onPressed: () => Get.offAllNamed(AppRoutes.signUp),
                  child: const Text(
                    'Sign Up',
                    textScaleFactor: 1.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
