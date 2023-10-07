import 'package:coffee_shop/core/providers/general_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authDataProvider = Provider<AuthData>(
  (ref) => AuthDataImpl(ref: ref),
);

abstract class AuthData {
  Future<Either<String, User>> signUp(
      {required String email,
      required String password,
      required String phoneNumber});
  Future<Either<String, User>> signIn(
      {required String email, required String password});
  Future<Either<String, String>> forgotPassword({required String email});
  Future<Either<String, String>> signOut();
}

class AuthDataImpl implements AuthData {
  final Ref _ref;

  AuthDataImpl({required Ref ref}) : _ref = ref;
  // use for reading other providers

  @override
  Future<Either<String, User>> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _ref
          .read(firebaseAuthProvider)
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user == null) {
        return const Left("Unable to signin, please try again");
      }
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(e.message.toString());
    } catch (e) {
      return const Left("Unable to signin, please try again");
    }
  }

  @override
  Future<Either<String, String>> forgotPassword({required String email}) async {
    try {
      await _ref
          .read(firebaseAuthProvider)
          .sendPasswordResetEmail(email: email);
      return Right("the reset link has been sent to $email");
    } on FirebaseAuthException catch (e) {
      return Left(e.message.toString());
    }
  }

  @override
  Future<Either<String, String>> signOut() async {
    try {
      await _ref.read(firebaseAuthProvider).signOut();
      return const Right("signed out successfully");
    } catch (e) {
      return const Left("Error signing out");
    }
  }

  @override
  Future<Either<String, User>> signUp(
      {required String email,
      required String password,
      required String phoneNumber}) async {
    try {
      UserCredential userCredential = await _ref
          .read(firebaseAuthProvider)
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user == null) {
        return const Left("Unable to signup, please try again");
      }
      return Right(user);
    } on FirebaseAuthException catch (e) {
      return Left(e.message ?? "signup failed");
    } catch (e) {
      return const Left("Unable to signin, please try again");
    }
  }
}
