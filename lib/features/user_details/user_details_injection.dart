import 'package:get_it/get_it.dart';
import 'package:test/features/user_details/data/data_sources/local/user_details_local_data_source.dart';
import 'package:test/features/user_details/data/data_sources/user_details_data_source.dart';
import 'package:test/features/user_details/data/repositories/user_details_repository_impl.dart';
import 'package:test/features/user_details/domain/repositories/user_details_repository.dart';
import 'package:test/features/user_details/domain/use_cases/get_user_details.dart';
import 'package:test/features/user_details/domain/use_cases/submit_phone_number.dart';
import 'package:test/features/user_details/presentation/cubit/user_details_cubit.dart';

Future<void> initUserDetailsModule(GetIt sl) async {
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
