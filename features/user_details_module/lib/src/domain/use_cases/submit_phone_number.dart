import 'package:dartz/dartz.dart';
import 'package:shared/core/errors/failures.dart';
import 'package:shared/core/usecases/usecase.dart';
import 'package:user_details_module/src/domain/repositories/user_details_repository.dart';

class SubmitPhoneNumber extends UseCase<void, String> {
  final UserDetailsRepository repository;

  SubmitPhoneNumber(this.repository);

  @override
  Future<Either<Failure, bool>> call(String phoneNumber) {
    return repository.submitPhoneNumber(phoneNumber);
  }
}