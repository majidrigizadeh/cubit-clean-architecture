import 'package:dartz/dartz.dart';
import 'package:shared/core/errors/failures.dart';
import 'package:user_details_module/src/data/data_sources/user_details_data_source.dart';
import 'package:user_details_module/src/data/mappers/user_mapper.dart';
import 'package:user_details_module/src/domain/entities/user.dart';
import 'package:user_details_module/src/domain/repositories/user_details_repository.dart';

class UserDetailsRepositoryImpl implements UserDetailsRepository {
  final UserDetailsDataSource remoteDataSource;

  UserDetailsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> getUserDetails() async {
    try {
      final userModel = await remoteDataSource.fetchUserDetails();
      // 2. Convert data model to domain entity using mapper
      final userEntity = UserMapper.toEntity(userModel);
      return Right(userEntity);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> submitPhoneNumber(String phoneNumber) async {
    try {
      final result = await remoteDataSource.submitPhoneNumber(phoneNumber);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
