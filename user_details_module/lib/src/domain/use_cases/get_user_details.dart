import 'package:dartz/dartz.dart';
import 'package:shared/core/errors/failures.dart';
import 'package:shared/core/usecases/usecase.dart';
import 'package:user_details_module/src/domain/entities/user.dart';
import 'package:user_details_module/src/domain/repositories/user_details_repository.dart';

class GetUserDetails extends UseCase<User, NoParams> {
  final UserDetailsRepository repository;

  GetUserDetails(this.repository);

  @override
  Future<Either<Failure, User>> call(NoParams params) {
    return repository.getUserDetails();
  }
}