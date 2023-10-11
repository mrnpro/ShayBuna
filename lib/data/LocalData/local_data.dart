abstract class LocalData {
  bool isExists({required String key});
  read({required String key});
  void write({required String key, required dynamic value});
  Future<void> clear({required String key});
  Future<void> clearAll();
}
