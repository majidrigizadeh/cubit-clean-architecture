import 'package:get_it/get_it.dart';
import 'package:user_details_module/src/data/data_sources/local/user_details_local_data_source.dart';
import 'package:user_details_module/src/data/data_sources/user_details_data_source.dart';
import 'package:user_details_module/src/data/repositories/user_details_repository_impl.dart';
import 'package:user_details_module/src/domain/repositories/user_details_repository.dart';
import 'package:user_details_module/src/domain/use_cases/get_user_details.dart';
import 'package:user_details_module/src/domain/use_cases/submit_phone_number.dart';
import 'package:user_details_module/src/presentation/cubit/user_details_cubit.dart';

final sl = GetIt.instance;

Future<void> initUserDetailsModule() async {
  // DATA SOURCES
  sl.registerLazySingleton<UserDetailsDataSource>(
    () => UserDetailsLocalDataSourceImpl(),
  );

  // REPOSITORIES
  sl.registerLazySingleton<UserDetailsRepository>(
    () => UserDetailsRepositoryImpl(remoteDataSource: sl()),
  );

  // USE CASES
  sl.registerLazySingleton(() => GetUserDetails(sl()));
  sl.registerLazySingleton(() => SubmitPhoneNumber(sl()));

  // CUBIT
  sl.registerFactory(
    () => UserDetailsCubit(
      getUserDetailsUseCase: sl(),
      submitPhoneNumberUseCase: sl(),
    ),
  );
}
