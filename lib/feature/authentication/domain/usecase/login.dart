import 'package:apple_shop/config/usecase/usecase.dart';
import 'package:apple_shop/config/utility/failure.dart';
import 'package:apple_shop/feature/authentication/data/repository/auth_repository.dart';
import 'package:apple_shop/di/di.dart';
import 'package:dartz/dartz.dart';

class LoginParams extends Params {
  final String username;
  final String password;
  LoginParams({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [username, password];
}

class Login extends Usecase<Failure, String> {
  final IAuthRepository _repository = locator.get();

  @override
  Future<Either<Failure, String>> call(Params? params) async {
    var loginParams = params as LoginParams;
    return await _repository.login(
      loginParams.username,
      loginParams.password,
    );
  }
}
