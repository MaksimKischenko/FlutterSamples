
class Cat {
  
  Cat() {
    print('I\'m constructed');
  }
  
  int? _age;
  
  int get age {
    if (_age==null) {
      print('I\'m born');
      _age = 0;
    }
    return _age!;
  }
}