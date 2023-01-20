abstract class AuthFailure {
  final String? message;
  const AuthFailure(this.message);
}

class ServerFailure extends AuthFailure {
  const ServerFailure(String message) : super(message);
}

class ConnectionFailure extends AuthFailure {
  const ConnectionFailure(String message) : super(message);
}
