import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/core/navigation/app_routes.dart';
import 'package:test/core/di/service_locator.dart' as di;
import 'package:test/features/user_details/presentation/cubit/user_details_cubit.dart';
import 'package:test/features/user_details/presentation/pages/user_details_page.dart';

/// Returns [Route] objects based on route names.
/// Use [onGenerateRoute] in [MaterialApp].
class AppPages {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    print('settings.name ${settings.name}');
    switch (settings.name) {
      case AppRoutes.userDetails:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => di.sl<UserDetailsCubit>(),
            child:  UserDetailsPage(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => di.sl<UserDetailsCubit>(),
            child: UserDetailsPage(),
          ),
        );
    }
  }
}
