import 'package:flutter/material.dart';

import 'package:pokemon_ipt/constants/routes.dart';
import 'package:pokemon_ipt/pages/exports.dart';

class ApplicationRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN_ROUTE:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      default:
        return MaterialPageRoute(builder: (_) => const LoginPage());
    }
  }
}
