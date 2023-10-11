import 'package:coffee_shop/Models/user.dart';
import 'package:coffee_shop/data/AuthData/auth_data.dart';
import 'package:coffee_shop/presentation/controllers/AuthController/auth_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authNotifierProvider =
    StateNotifierProvider<AuthController, AuthenticationState>(
        (ref) => AuthController(authData: ref.read(authDataProvider)));

class AuthController extends StateNotifier<AuthenticationState> {
  final AuthData _authData;

  AuthController({required AuthData authData})
      : _authData = authData,
        super(const AuthenticationState.initial());

  Future<void> login({required String email, required String password}) async {
    state = const AuthenticationState.loading();
    final response = await _authData.signIn(email: email, password: password);
    state = response.fold((l) => AuthenticationState.error(error: l),
        (r) => AuthenticationState.authenticated(user: r));
  }

  Future<void> signUp({required UserModel user}) async {
    state = const AuthenticationState.loading();
    final response = await _authData.signUp(userModel: user);
    state = response.fold((l) => AuthenticationState.error(error: l),
        (r) => AuthenticationState.authenticated(user: r));
  }

  Future<void> signOut() async {
    await _authData.signOut();
  }

  Future<void> forgotPassword(String email) async {
    state = const AuthenticationState.loading();
    final response = await _authData.forgotPassword(email: email);
    state = response.fold((l) => AuthenticationState.error(error: l),
        (r) => AuthenticationState.wildSucceed(message: r));
  }
}
