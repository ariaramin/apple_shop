abstract class IAuthDatasource {
  Future<void> register(
    String username,
    String password,
    String confirmPassword,
  );

  Future<String> login(
    String username,
    String password,
  );
}
