import 'package:ecommat/route/app_routes.dart';
import 'package:ecommat/view/Dashboard/dashboard_binding.dart';
import 'package:ecommat/view/onboarding/onboarding.dart';
import 'package:get/get.dart';

class AppPage {
  static var list = [
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
      binding: DashBoardBinding(),
    )
  ];
}
