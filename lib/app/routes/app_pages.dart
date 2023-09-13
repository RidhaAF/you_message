import 'package:get/get.dart';
import 'package:you_message/app/modules/auth/sign_in/sign_in_binding.dart';
import 'package:you_message/app/modules/auth/sign_in/sign_in_page.dart';
import 'package:you_message/app/modules/auth/sign_up/sign_up_binding.dart';
import 'package:you_message/app/modules/auth/sign_up/sign_up_page.dart';
import 'package:you_message/app/modules/messages/message/message_binding.dart';
import 'package:you_message/app/modules/messages/message/message_page.dart';
import 'package:you_message/app/modules/messages/message_detail/message_detail_binding.dart';
import 'package:you_message/app/modules/messages/message_detail/message_detail_page.dart';
import 'package:you_message/app/routes/app_routes.dart';

class AppPages {
  static final pages = [
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
    GetPage(
      name: AppRoutes.message,
      page: () => const MessagePage(),
      binding: MessageBinding(),
    ),
    GetPage(
      name: AppRoutes.messageDetail,
      page: () => const MessageDetailPage(),
      binding: MessageDetailBinding(),
    ),
  ];
}
