import 'package:learning_free_code_camp/services/auth/auth_provider.dart';
import 'package:learning_free_code_camp/services/auth/auth_user.dart';

class AuthService implements AuthProvider {
  final AuthProvider authProvider;
  AuthService({required this.authProvider});

  @override
  Future<AuthUser?> createUser(
          {required String email, required String password}) =>
      authProvider.createUser(email: email, password: password);

  @override
  AuthUser? get currentUser => authProvider.currentUser;

  @override
  Future<AuthUser> logIn({required String email, required String password}) =>
      authProvider.logIn(email: email, password: password);

  @override
  Future<void> logout() => authProvider.logout();

  @override
  Future<void> sendVerification() => authProvider.sendVerification();
}
