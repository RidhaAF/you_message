import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:you_message/app/routes/app_pages.dart';
import 'package:you_message/app/routes/app_routes.dart';
import 'package:you_message/app/utils/constants/env.dart';
import 'package:you_message/app/utils/themes/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: Env.baseURL,
    anonKey: Env.anonKey,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'YouMessage',
      debugShowCheckedModeBanner: false,
      theme: AppThemes().light,
      darkTheme: AppThemes().dark,
      initialRoute: AppRoutes.initial,
      getPages: AppPages.pages,
    );
  }
}
