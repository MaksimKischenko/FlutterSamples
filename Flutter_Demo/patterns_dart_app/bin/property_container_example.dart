class NoPropertyException {}

class InvalidKeyException {}

class AnimalProperties<T> {
  final Map<String,T> _properties = {};
  
  Object? operator [](String key) {
    if (_properties.containsKey(key)) return _properties[key];
    throw NoPropertyException();    
  }
  
  void operator[]=(String key, T value) {
    if (key.startsWith('#')) throw InvalidKeyException();
    _properties[key] = value;
  }
}