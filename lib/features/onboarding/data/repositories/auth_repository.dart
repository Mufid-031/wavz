import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/dio_client.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  AuthRepository(this._dio);
  final Dio _dio;

  Future<String> login(String email, String password) async {
    // Simulated API call
    await Future.delayed(const Duration(seconds: 1));
    if (email == 'test@wavz.com' && password == 'password') {
      return 'fake-jwt-token';
    }
    throw Exception('Invalid credentials');
  }

  Future<void> register(String name, String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final dio = ref.watch(dioClientProvider);
  return AuthRepository(dio);
}
