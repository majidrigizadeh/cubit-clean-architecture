import 'package:flutter/material.dart';
import 'package:test/core/navigation/app_routes.dart';
import 'package:user_details_module/user_details_module.dart';

/// Returns [Route] objects based on route names.
/// Use [onGenerateRoute] in [MaterialApp].
class AppPages {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.userDetails:
        return MaterialPageRoute(
          builder: (_) => UserDetailsModule.create(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
    }
  }
}
