import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/core/usecases/usecase.dart';
import 'package:user_details_module/src/domain/use_cases/get_user_details.dart';
import 'package:user_details_module/src/domain/use_cases/submit_phone_number.dart';
import 'package:user_details_module/src/presentation/cubit/user_details_state.dart';

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
      (result) {
        if (result) {
          emit(PhoneNumberSubmitted());
        } else {
          emit(UserDetailsError(message: 'Error on submit phone number'));
        }
        loadUserDetails();
      },
    );
  }
}
