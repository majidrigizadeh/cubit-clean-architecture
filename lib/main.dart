import 'package:flutter/material.dart';
import 'package:test/core/di/service_locator.dart' as di;
import 'package:test/core/navigation/app_pages.dart';
import 'package:test/core/navigation/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clean Architecture Cubit Demo',
      initialRoute: AppRoutes.userDetails,
      onGenerateRoute: AppPages.onGenerateRoute,
    );
  }
}
