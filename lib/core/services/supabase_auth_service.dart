import 'dart:async';
import 'dart:developer';
import 'package:fruitify/core/errors/exeption.dart';
import 'package:fruitify/core/errors/supabase_exception_handler.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthService {
  final GoTrueClient _auth;
  User? get currentUser => _auth.currentUser;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  bool _isInitialized = false;

  SupabaseAuthService(this._auth);

  Future<void> _ensureInitialized() async {
    if (_isInitialized) return;

    await _googleSignIn.initialize(
      clientId:
          '198508760658-mqth9ndfobbtpfnmmvsesmp7rqfr4igj.apps.googleusercontent.com',
      serverClientId:
          '198508760658-7m2t442akckssr8iibnk80cvpc79ngk3.apps.googleusercontent.com',
    );

    _isInitialized = true;
  }

  // =========================
  // Email Authentication
  // =========================

  Future<User> signUpWithEmail({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await _auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );

      final user = response.user;

      if (user == null) {
        throw const CustomException(
          message: 'تعذر إنشاء الحساب. يرجى المحاولة مرة أخرى.',
        );
      }

      return user;
    } catch (e, s) {
      log('SupabaseAuthService.signUpWithEmail', error: e, stackTrace: s);

      throw SupabaseErrorHandler.handle(e);
    }
  }

  Future<User> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;

      if (user == null) {
        throw const CustomException(
          message: 'تعذر تسجيل الدخول. يرجى المحاولة مرة أخرى.',
        );
      }

      return user;
    } catch (e, s) {
      log('SupabaseAuthService.signInWithEmail', error: e, stackTrace: s);

      throw SupabaseErrorHandler.handle(e);
    }
  }

  // =========================
  // Google Authentication
  // =========================

  Future<User> signInWithGoogle() async {
    try {
      await _ensureInitialized();

      final googleUser = await _googleSignIn.authenticate();

      final idToken = googleUser.authentication.idToken;

      if (idToken == null) {
        throw const CustomException(
          message: 'تعذر الحصول على بيانات حساب Google.',
        );
      }

      final response = await _auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
      );

      if (response.user == null) {
        throw const CustomException(
          message: 'تعذر تسجيل الدخول بواسطة Google.',
        );
      }

      return response.user!;
    } on CustomException {
      rethrow;
    } catch (e, s) {
      log('SupabaseAuthService.signInWithGoogle', error: e, stackTrace: s);

      print('==============================');
      print(e);
      print(e.runtimeType);
      print('==============================');

      rethrow;
    }
  }

  // =========================
  // Facebook Authentication
  // =========================

  Future<User> logInWithFacebook() async {
    try {
      final completer = Completer<User>();

      late final StreamSubscription<AuthState> subscription;

      subscription = _auth.onAuthStateChange.listen((data) {
        if (data.event == AuthChangeEvent.signedIn &&
            data.session?.user != null) {
          completer.complete(data.session!.user);
          subscription.cancel();
        }
      });

      await _auth.signInWithOAuth(
        OAuthProvider.facebook,
        redirectTo: 'com.example.friuts://login-callback',
        scopes: 'email,public_profile',
      );

      final user = await completer.future.timeout(
        const Duration(minutes: 2),
        onTimeout: () {
          subscription.cancel();

          throw const CustomException(
            message: 'انتهت مهلة تسجيل الدخول بواسطة Facebook.',
          );
        },
      );

      log('Provider Token: ${_auth.currentSession?.providerToken}');

      return user;
    } catch (e, s) {
      log('SupabaseAuthService.logInWithFacebook', error: e, stackTrace: s);

      throw SupabaseErrorHandler.handle(e);
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
    } catch (e, s) {
      log('SupabaseAuthService.signOut', error: e, stackTrace: s);

      throw SupabaseErrorHandler.handle(e);
    }
  }
}
