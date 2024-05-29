const maxConnections = 2;

class PooledDatabase {
  
  PooledDatabase.connection();
  
  bool _isBusy = false;
  
  static List<PooledDatabase>? _pool;
  
  factory PooledDatabase() {
    //первое обращение - создаем объекты
    _pool ??= List<PooledDatabase>.generate(maxConnections, (_) => PooledDatabase.connection()).toList();
    print('Pool is ${_pool!.map((p) => p.hashCode).join(', ')}');
    //ищем свободный объект в пуле
    try {
      final connection = _pool!.firstWhere((db) => !db._isBusy);
      connection._isBusy = true;
      return connection;
    } catch (e) {
      //пул весь заполнен
      throw Exception('Not enough connections');
    }
  }
  
  static release(PooledDatabase connection) {
    connection._isBusy = false;
  }
}