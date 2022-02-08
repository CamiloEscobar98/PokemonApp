import 'package:flutter/material.dart';
import 'package:pokemon_ipt/constants/exports.dart';
import 'package:pokemon_ipt/pages/configuration/config_page.dart';
import 'package:pokemon_ipt/pages/exports.dart';

class ApplicationRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SIGNUP_ROUTE:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case LOGIN_ROUTE:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case HOME_ROUTE:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case PROFILE_ROUTE:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case CONFIG_ROUTE:
        return MaterialPageRoute(builder: (_) => const ConfigurationPage());
      default:
        return MaterialPageRoute(builder: (_) => const LoginPage());
    }
  }
}
