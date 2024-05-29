class Logger {

  static final Map<String, Logger> _cache = {};

  factory Logger() {
    return _cache.putIfAbsent('', () => Logger._internal());
  }

  Logger._internal() {
   print('New logger created with name ');
  }
}


Map<Type, Object> services = {};

// class DBConnection {
//   DBConnection._();
  
//   factory DBConnection() {
//     if (!services.containsKey(DBConnection)) {
//       services[DBConnection] = DBConnection._();
//     }
//     return services[DBConnection] as DBConnection;
//   }
// }