import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruitify/core/errors/exeption.dart';
import 'package:fruitify/core/errors/failure.dart';
import 'package:fruitify/core/services/database_service.dart';
import 'package:fruitify/core/services/shared_preferences_singleton.dart';
import 'package:fruitify/core/services/supabase_auth_service.dart';
import 'package:fruitify/features/auth/data/models/user_model.dart';
import 'package:fruitify/features/auth/doamin/entities/user_entity.dart';
import 'package:fruitify/features/auth/doamin/repos/auth_rebo.dart';

class AuthRepositoryImpl extends AuthRepo {
  final SupabaseAuthService supabaseAuthService;
  final DatabaseService databaseService;

  AuthRepositoryImpl({
    required this.supabaseAuthService,
    required this.databaseService,
  });

  Future<void> _saveUserIfNotExists(UserModel user) async {
    final isUserExists = await databaseService.checkIfDataExists(
      path: 'users',
      id: user.uId,
    );

    if (!isUserExists) {
      await databaseService.addData(path: 'users', data: user.toMap());
    }
  }

  Future<UserModel> _getOrCreateUser(user) async {
    final authUser = UserModel.fromSupabaseUser(user);

    await _saveUserIfNotExists(authUser);

    final userData = await databaseService.getDataById(
      path: 'users',
      id: authUser.uId,
    );

    return userData == null ? authUser : UserModel.fromJson(userData);
  }

  Future<UserEntity> _handleOAuthUser(user) async {
    final userModel = await _getOrCreateUser(user);

    await saveUserData(userModel);
    return userModel;
  }

  Failure _handleFailure(Object error, String message) {
    log(error.toString());
    return ServerFailure(message);
  }

@override
Future<Either<Failure, UserEntity>> signUpWithEmail({
  required String email,
  required String password,
  required String name,
}) async {
  try {
    final user = await supabaseAuthService.signUpWithEmail(
      email: email,
      password: password,
      name: name,
    );

    final userModel = await _getOrCreateUser(user);

    await saveUserData(userModel);

    return Right(userModel);
  } on CustomException catch (e) {
    return Left(ServerFailure(e.message));
  } catch (e) {
    return Left(
      _handleFailure(
        e,
        'تعذر إنشاء الحساب. يرجى المحاولة مرة أخرى.',
      ),
    );
  }
}
  @override
  bool isLoggedIn() {
    return supabaseAuthService.currentUser != null;
  }

Future<void> saveUserData(UserModel user) async {
  await prehs.saveUserData(user);
}

  @override
Future<Either<Failure, UserEntity>> logInWithEmail({
  required String email,
  required String password,
}) async {
  try {
    final user = await supabaseAuthService.signInWithEmail(
      email: email,
      password: password,
    );

    final userModel = await _getOrCreateUser(user);

    await saveUserData(userModel);

    return Right(userModel);
  } on CustomException catch (e) {
    return Left(ServerFailure(e.message));
  } catch (e) {
    return Left(
      _handleFailure(
        e,
        'تعذر تسجيل الدخول. يرجى المحاولة مرة أخرى.',
      ),
    );
  }
}

  @override
  Future<Either<Failure, UserEntity>> logInWithGoogle() async {
    try {
      final user = await supabaseAuthService.signInWithGoogle();

      final userEntity = await _handleOAuthUser(user);

      return Right(userEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(
        _handleFailure(e, 'حدث خطأ أثناء تسجيل الدخول بواسطة Google.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> logInWithFacebook() async {
    try {
      final user = await supabaseAuthService.logInWithFacebook();

      final userEntity = await _handleOAuthUser(user);

      return Right(userEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(
        _handleFailure(e, 'حدث خطأ أثناء تسجيل الدخول بواسطة Facebook.'),
      );
    }
  }
}
