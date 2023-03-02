import 'package:apple_shop/config/usecase/usecase.dart';
import 'package:apple_shop/config/utility/failure.dart';
import 'package:apple_shop/features/authentication/data/repository/auth_repository.dart';
import 'package:apple_shop/di/di.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

class RegisterParams extends Params {
  final String username;
  final String password;
  final String confirmPassword;

  RegisterParams({
    required this.username,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [username, password, confirmPassword];
}

class Register extends Usecase<Failure, String> {
  final IAuthRepository _repository = locator.get();

  @override
  Future<Either<Failure, String>> call(Params? params) async {
    var registerParams = params as RegisterParams;
    return await _repository.register(
      registerParams.username,
      registerParams.password,
      registerParams.confirmPassword,
    );
  }
}
