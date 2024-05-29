class SecureStorageManager {
  static Future<String?> get token =>
      Future.delayed(Duration(seconds: 2), () => 'someToken');

  // static Future<String?> get token =>
  //     Future.delayed(Duration(seconds: 5), () => null);
}
