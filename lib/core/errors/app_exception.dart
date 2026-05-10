import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

@freezed
class AppException with _$AppException implements Exception {
  const factory AppException.network([String? message]) = _Network;
  const factory AppException.server(String message, [int? statusCode]) = _Server;
  const factory AppException.auth(String message) = _Auth;
  const factory AppException.cache(String message) = _Cache;
  const factory AppException.unknown([String? message]) = _Unknown;

  @override
  String toString() {
    return map(
      network: (e) => e.message ?? 'Network Error',
      server: (e) => 'Server Error (${e.statusCode}): ${e.message}',
      auth: (e) => 'Auth Error: ${e.message}',
      cache: (e) => 'Cache Error: ${e.message}',
      unknown: (e) => e.message ?? 'Unknown Error',
    );
  }
}
