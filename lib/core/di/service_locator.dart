import 'package:get_it/get_it.dart';
import 'package:user_details_module/user_details_module.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await initUserDetailsModule();
}
