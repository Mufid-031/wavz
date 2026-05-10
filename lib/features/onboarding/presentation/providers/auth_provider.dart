import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/auth_repository.dart';
import 'auth_state.dart';
import '../../../../core/services/storage_service.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    // Check for existing token on build
    _checkAuth();
    return const AuthState.initial();
  }

  Future<void> _checkAuth() async {
    final storage = await ref.read(storageServiceProvider.future);
    final token = await storage.readSecure('token');
    
    if (token != null) {
      state = AuthState.authenticated(token: token);
    } else {
      state = const AuthState.unauthenticated();
    }
  }

  Future<void> login(String email, String password) async {
    state = const AuthState.loading();
    try {
      final token = await ref.read(authRepositoryProvider).login(email, password);
      final storage = await ref.read(storageServiceProvider.future);
      await storage.writeSecure('token', token);
      state = AuthState.authenticated(token: token);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> logout() async {
    final storage = await ref.read(storageServiceProvider.future);
    await storage.deleteSecure('token');
    await ref.read(authRepositoryProvider).logout();
    state = const AuthState.unauthenticated();
  }
}
