import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>(
  (ref) => FirebaseAuth.instance,
);
final firebaseDatabase = Provider<FirebaseDatabase>((ref) {
  final firebaseApp = Firebase.app(); // you can use it like this
  final rtdb = FirebaseDatabase.instanceFor(
      app: firebaseApp,
      databaseURL: 'https://flutter-326720-default-rtdb.firebaseio.com');

  return rtdb;
});
