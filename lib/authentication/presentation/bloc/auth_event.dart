abstract class AuthEvent {}

class LoginRequest extends AuthEvent {
  String username, password;
  LoginRequest(this.username, this.password);
}

class RegisterRequest extends AuthEvent {
  String username, password, confirmPassword;
  RegisterRequest(this.username, this.password, this.confirmPassword);
}
