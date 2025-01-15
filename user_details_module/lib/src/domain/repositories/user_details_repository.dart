import 'package:dartz/dartz.dart';
import 'package:shared/core/errors/failures.dart';
import 'package:user_details_module/src/domain/entities/user.dart';

abstract class UserDetailsRepository {
  Future<Either<Failure, User>> getUserDetails();
  Future<Either<Failure, bool>> submitPhoneNumber(String phoneNumber);
}