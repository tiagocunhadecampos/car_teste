class ServerException implements Exception {}

class CacheException implements Exception {}

class AppDatabaseException implements Exception {
  final String message;

  AppDatabaseException(this.message);

  @override
  String toString() {
    return 'DatabaseException: $message';
  }
}
