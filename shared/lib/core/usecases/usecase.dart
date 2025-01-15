import 'package:dartz/dartz.dart';
import 'package:shared/core/errors/failures.dart';


/// This is a type that represents a Unit or "no parameters" use case.
class NoParams {}

/// Base class for all Use Cases in the domain layer.
/// [Type] is the return type of the use case (e.g., an Entity).
/// [Params] is the input parameters for the use case. If your use case
/// does not need parameters, you can use [NoParams].
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}