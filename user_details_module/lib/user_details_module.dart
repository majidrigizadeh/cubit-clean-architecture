export 'package:user_details_module/src/user_details_injection.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_details_module/src/presentation/cubit/user_details_cubit.dart';
import 'package:user_details_module/src/presentation/pages/user_details_page.dart';
import 'package:user_details_module/src/user_details_injection.dart';

class UserDetailsModule {
  static Widget create() {
    return BlocProvider(
      create: (_) => UserDetailsCubit(
        getUserDetailsUseCase: sl(),
        submitPhoneNumberUseCase: sl(),
      ),
      child: UserDetailsPage(),
    );
  }
}
