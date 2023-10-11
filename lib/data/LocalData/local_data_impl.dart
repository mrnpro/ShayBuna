import 'package:coffee_shop/riverpod_container.dart';
import 'package:coffee_shop/data/LocalData/local_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final localDataProvider = FutureProvider<LocalData>((ref) async {
  final sharedPreferences = await ref.watch(sharedPreferenceProvider.future);

  return LocalDataImpl(sharedPreferences: sharedPreferences);
});

class LocalDataImpl implements LocalData {
  final SharedPreferences _sharedPreferences;

  LocalDataImpl({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;
  @override
  Future<void> clear({required String key}) async {
    try {
      await _sharedPreferences.remove(key);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> clearAll() async {
    try {
      await _sharedPreferences.clear();
    } catch (e) {
      rethrow;
    }
  }

  @override
  bool isExists({required String key}) {
    try {
      final exists = _sharedPreferences.containsKey(key);
      return exists;
    } catch (e) {
      rethrow;
    }
  }

  @override
  read({required String key}) {
    try {
      return _sharedPreferences.get(key);
    } catch (e) {
      rethrow;
    }
  }

  @override
  void write({required String key, required value}) {
    try {
      if (value.runtimeType == bool) {
        _sharedPreferences.setBool(key, value);
      } else {
        _sharedPreferences.setString(key, value);
      }
    } catch (e) {
      rethrow;
    }
  }
}
