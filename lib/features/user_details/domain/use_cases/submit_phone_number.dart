import 'package:dartz/dartz.dart';
import 'package:test/core/errors/failures.dart';
import 'package:test/core/usecases/usecase.dart';
import 'package:test/features/user_details/domain/repositories/user_details_repository.dart';

class SubmitPhoneNumber extends UseCase<void, String> {
  final UserDetailsRepository repository;

  SubmitPhoneNumber(this.repository);

  @override
  Future<Either<Failure, bool>> call(String phoneNumber) {
    return repository.submitPhoneNumber(phoneNumber);
  }
}