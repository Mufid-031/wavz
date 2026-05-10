import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'storage_service.g.dart';

class StorageService {
  StorageService({
    required SharedPreferences prefs,
    required FlutterSecureStorage secureStorage,
  })  : _prefs = prefs,
        _secureStorage = secureStorage;

  final SharedPreferences _prefs;
  final FlutterSecureStorage _secureStorage;

  // SharedPreferences methods
  Future<bool> setBool(String key, bool value) => _prefs.setBool(key, value);
  bool? getBool(String key) => _prefs.getBool(key);

  // SecureStorage methods
  Future<void> writeSecure(String key, String value) => _secureStorage.write(key: key, value: value);
  Future<String?> readSecure(String key) => _secureStorage.read(key: key);
  Future<void> deleteSecure(String key) => _secureStorage.delete(key: key);

  // Hive methods (placeholder for initialization)
  static Future<void> initHive() async {
    await Hive.initFlutter();
  }
}

@riverpod
Future<StorageService> storageService(StorageServiceRef ref) async {
  final prefs = await SharedPreferences.getInstance();
  const secureStorage = FlutterSecureStorage();
  return StorageService(prefs: prefs, secureStorage: secureStorage);
}
