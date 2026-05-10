import 'package:dio/dio.dart';
import '../../services/storage_service.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._storageService);
  final StorageService _storageService;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _storageService.readSecure('token');
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}
