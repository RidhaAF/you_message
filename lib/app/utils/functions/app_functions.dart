import 'package:you_message/app/routes/app_routes.dart';
import 'package:you_message/app/utils/constants/app_constants.dart';

String getInitialRoute() {
  final session = supabase.auth.currentSession;
  String route = AppRoutes.home;

  if (session == null) {
    route = AppRoutes.signUp;
  }

  return route;
}
