import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) => FirebaseAuth.instance,
);
final firebaseDatabaseProvider = Provider<FirebaseDatabase>((ref) {
  final rtdb = FirebaseDatabase.instance;
  return rtdb;
});
final sharedPreferenceProvider = FutureProvider<SharedPreferences>((ref) async {
  final instance = await SharedPreferences.getInstance();
  return instance;
});
