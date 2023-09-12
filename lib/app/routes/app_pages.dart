import 'package:get/get.dart';
import 'package:you_message/app/modules/home/home_binding.dart';
import 'package:you_message/app/modules/home/home_page.dart';
import 'package:you_message/app/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    )
  ];
}
