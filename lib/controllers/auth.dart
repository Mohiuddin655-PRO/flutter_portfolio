import 'package:auth_management/core.dart';
import 'package:flutter_androssy/widgets.dart';

class CustomAuthController extends AuthController {
  CustomAuthController({
    super.backupHandler,
    super.messages,
  });

  Future<bool> signIn(AuthInfo data) async {
    "signIn: Sign in operation is called".logValue;
    // await super.signInByEmail(
    //   EmailAuthenticator(
    //     email: data.email.use,
    //     password: data.password.use,
    //   ),
    //   biometric: true,
    // );
    return true;
  }

  Future<bool> signInWithApple(AuthInfo data) async {
    "signInWithApple: SignInWithApple in operation is called".logValue;
    // await super.signInByApple();
    return true;
  }

  Future<bool> signInWithBiometric(AuthInfo data) async {
    "signInWithBiometric: SignInWithBiometric in operation is called".logValue;
    // try {
    //   await super.signInByBiometric();
    // } catch (_) {
    //   emit(AuthResponse.failure(_));
    // }
    return true;
  }

  Future<bool> signInWithGoogle(AuthInfo data) async {
    "signInWithGoogle: SignInWithGoogle in operation is called".logValue;
    // await super.signInByGoogle();
    return true;
  }

  Future<bool> signInWithFacebook(AuthInfo data) async {
    "signInWithFacebook: SignInWithFacebook in operation is called".logValue;
    // await super.signInByFacebook();
    return true;
  }

  Future<bool> signUp(AuthInfo data) async {
    "signUp: SignUp in operation is called".logValue;
    // await super.signUpByEmail(
    //   EmailAuthenticator(
    //     email: data.email.use,
    //     password: data.password.use,
    //   ),
    //   biometric: true,
    // );
    return true;
  }

  Future<bool> forgot(AuthInfo data) async {
    "forgot: Forgot in operation is called".logValue;
    return true;
  }
}

class AuthInfo {
  final String email;
  final String password;

  const AuthInfo({
    this.email = "",
    this.password = "",
  });
}
