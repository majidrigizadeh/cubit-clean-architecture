import 'package:dartz/dartz.dart';
import 'package:test/core/errors/failures.dart';
import 'package:test/core/usecases/usecase.dart';
import 'package:test/features/user_details/domain/entities/user.dart';
import 'package:test/features/user_details/domain/repositories/user_details_repository.dart';

class GetUserDetails extends UseCase<User, NoParams> {
  final UserDetailsRepository repository;

  GetUserDetails(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams params) {
    return repository.getUserDetails();
  }
}