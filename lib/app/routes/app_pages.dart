import 'package:get/get.dart';
import 'package:you_message/app/modules/auth/sign_in/sign_in_binding.dart';
import 'package:you_message/app/modules/auth/sign_in/sign_in_page.dart';
import 'package:you_message/app/modules/auth/sign_up/sign_up_binding.dart';
import 'package:you_message/app/modules/auth/sign_up/sign_up_page.dart';
import 'package:you_message/app/modules/home/home_binding.dart';
import 'package:you_message/app/modules/home/home_page.dart';
import 'package:you_message/app/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.signIn,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),
  ];
}
