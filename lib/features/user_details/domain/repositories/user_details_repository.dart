import 'package:dartz/dartz.dart';
import 'package:test/core/errors/failures.dart';
import 'package:test/features/user_details/domain/entities/user.dart';

abstract class UserDetailsRepository {
  Future<Either<Failure, User>> getUserDetails();
  Future<Either<Failure, bool>> submitPhoneNumber(String phoneNumber);
}