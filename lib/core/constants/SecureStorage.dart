import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gotrue/gotrue.dart';

class SecureStorage extends GotrueAsyncStorage {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Future<void> remove(String key) => _storage.delete(key: key);

  @override
  Future<void> set(String key, String value) => _storage.write(key: key, value: value);

  @override
  Future<String?> get(String key) => _storage.read(key: key);

  @override
  Future<String?> getItem({required String key}) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<void> removeItem({required String key}) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }

  @override
  Future<void> setItem({required String key, required String value}) {
    // TODO: implement setItem
    throw UnimplementedError();
  }
}