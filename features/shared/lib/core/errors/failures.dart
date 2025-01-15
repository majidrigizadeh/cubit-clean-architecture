/// Base class for different types of failures.
abstract class Failure {
  const Failure();
}

/// Failure used when there is a server-side or network-related error.
class ServerFailure extends Failure {
  const ServerFailure();
}
