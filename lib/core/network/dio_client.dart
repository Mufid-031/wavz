import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/storage_service.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_interceptor.dart';

part 'dio_client.g.dart';

@riverpod
Dio dioClient(DioClientRef ref) {
  // Use a FutureProvider result or watch for storage service
  // Note: Since storageService is a FutureProvider, we need to handle its AsyncValue
  // For simplicity in this provider, we'll assume it's ready after Splash
  final storageService = ref.watch(storageServiceProvider).requireValue;

  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.wavz-music.com/v1', // Placeholder URL
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  dio.interceptors.addAll([
    AuthInterceptor(storageService),
    ErrorInterceptor(),
    if (kDebugMode)
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
  ]);

  return dio;
}
