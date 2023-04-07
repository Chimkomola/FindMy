import 'package:flutter/material.dart';
import 'package:missing/view/dashboard/person.dart';
import 'package:missing/view/forgot_password/forgot_password.dart';
import 'package:missing/view/dashboard/about.dart';
import 'package:missing/view/dashboard/help.dart';
import 'package:missing/view/dashboard/home_person.dart';
import 'package:missing/view/login/login.dart';
import 'package:missing/routes/route_name.dart';
import 'package:missing/view/signup/register.dart';
import 'package:missing/view/splash/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final arguments = settings.arguments;
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteName.loginView:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteName.registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case RouteName.forgotScreen:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case RouteName.missingPerson:
        return MaterialPageRoute(builder: (_) => const MissingPerson());
      case RouteName.aboutScreen:
        return MaterialPageRoute(builder: (_) => const AboutScreen());
      case RouteName.helpScreen:
        return MaterialPageRoute(builder: (_) => const HelpScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
