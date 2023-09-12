import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:you_message/app/modules/auth/sign_up/sign_up_controller.dart';
import 'package:you_message/app/utils/constants/app_constants.dart';
import 'package:you_message/app/widgets/default_button.dart';
import 'package:you_message/app/widgets/default_text_field.dart';
import 'package:you_message/app/widgets/default_spacer.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          textScaleFactor: 1.0,
        ),
        centerTitle: false,
      ),
      body: Form(
        key: signUpController.formKey,
        child: ListView(
          padding: EdgeInsets.all(defaultMargin),
          children: [
            DefaultTextField(
              controller: signUpController.emailCtrl.value,
              focusNode: signUpController.emailFocus.value,
              labelText: 'Email',
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
              controller: signUpController.passwordCtrl.value,
              focusNode: signUpController.passwordFocus.value,
              labelText: 'Password',
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
            DefaultSpacer(height: defaultMargin / 2),
            DefaultTextField(
              controller: signUpController.usernameCtrl.value,
              focusNode: signUpController.usernameFocus.value,
              labelText: 'Username',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Username is required';
                }
                final isValid = RegExp(r'^[A-Za-z0-9_]{3,24}$').hasMatch(value);
                if (!isValid) {
                  return 'Username must be 3-24 characters long with alphanumeric or underscore';
                }
                return null;
              },
            ),
            const DefaultSpacer(),
            Obx(
              () => DefaultButton(
                isLoading: signUpController.isLoading.value,
                onPressed: () => signUpController.signUp(),
                text: 'Sign Up',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                    color: mutedColor,
                  ),
                  textScaleFactor: 1.0,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Sign In',
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
