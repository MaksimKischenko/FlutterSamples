abstract interface class AppRepository<T> {
  Future<void> init();

  Future<List<T>?> getInstances();

  Future<T?> getInstance();

  Future<void> saveInstance(T object);

  Future<void> editInstance({required T editetObject, required int id});

  Future<void> deleteInstance();
}
