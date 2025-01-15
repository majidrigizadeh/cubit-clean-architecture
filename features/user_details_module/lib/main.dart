import 'package:flutter/material.dart';
import 'user_details_module.dart';

void main() {
  runApp(const UserDetailsModuleApp());
}

class UserDetailsModuleApp extends StatelessWidget {
  const UserDetailsModuleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Details Module',
      home: UserDetailsModule.create(),
    );
  }
}
