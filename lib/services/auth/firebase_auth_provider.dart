import 'package:learning_free_code_camp/services/auth/auth_provider.dart';
import 'package:learning_free_code_camp/services/auth/auth_user.dart';
import 'package:learning_free_code_camp/services/auth/auth_exception.dart';

import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseAuthException;

class FirebaseAuthProvide implements AuthProvider {
  @override
  Future<AuthUser?> createUser({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInException();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        throw WeakPasswordException();
      } else if (e.code == "email-already-in-use") {
        throw EmailAlreadyExistException();
      } else if (e.code == "invalid-email") {
        throw InvalidEmailIdException();
      }
    } catch (e) {
      throw GenericAuthException();
    }
  }

  @override
  AuthUser? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return AuthUser.fromFirebase(user);
    } else {
      return null;
    }
  }

  @override
  Future<void> sendVerification() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    } else {
      throw UserNotLoggedInException();
    }
  }

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserLoginExecption();
      }
    } catch (e) {
      throw GenericAuthException();
    }
  }

  @override
  Future<void> logout() async {
    try {
      final user = currentUser;
      if (user != null) {
        FirebaseAuth.instance.signOut();
      } else {
        throw UserNotLoggedInException();
      }
    } catch (e) {
      throw GenericAuthException();
    }
  }
}
