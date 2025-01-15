import 'package:get_it/get_it.dart';
import 'package:test/features/user_details/user_details_injection.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await initUserDetailsModule(sl);
}