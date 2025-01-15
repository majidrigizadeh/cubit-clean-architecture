import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/core/usecases/usecase.dart';
import 'package:test/features/user_details/domain/use_cases/get_user_details.dart';
import 'package:test/features/user_details/domain/use_cases/submit_phone_number.dart';
import 'package:test/features/user_details/presentation/cubit/user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  final GetUserDetails getUserDetailsUseCase;
  final SubmitPhoneNumber submitPhoneNumberUseCase;

  UserDetailsCubit({
    required this.getUserDetailsUseCase,
    required this.submitPhoneNumberUseCase,
  }) : super(UserDetailsInitial()) {
    loadUserDetails();
  }

  Future<void> loadUserDetails() async {
    emit(UserDetailsLoading());
    final response = await getUserDetailsUseCase.call(
      NoParams(),
    );
    response.fold(
      (failure) =>
          emit(UserDetailsError(message: 'Could not load user details')),
      (user) => emit(UserDetailsLoaded(user: user)),
    );
  }

  Future<void> submitPhoneNumber(String phoneNumber) async {
    emit(UserDetailsLoading());
    final response = await submitPhoneNumberUseCase.call(
      phoneNumber,
    );
    response.fold(
      (failure) =>
          emit(UserDetailsError(message: 'Could not submit phone number')),
      (_) {
        emit(PhoneNumberSubmitted());
        loadUserDetails();
      },
    );
  }
}
