import 'package:chilli/utils/route_name.dart';
import 'package:chilli/view/authorization/started_screen.dart';
import 'package:flutter/material.dart';
import '../constant/colors.dart';
import '../view/authorization/onboarding_screen.dart';
import '../view/splash_screen.dart';


class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case RoutesName.onboarding_screen:
        return MaterialPageRoute(builder: (context) => const OnboardingScreen());
      case RoutesName.startedScreen:
        return MaterialPageRoute(builder: (context) => const StartedScreen());
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text(
                "Invalid Route",
                style: TextStyle(color: AppColors.primaryColor, fontSize: 20),
              ),
            ),
          );
        });
    }
  }
}
