class Cat {
  String name;
  
  int age;
  
  bool verbose;
  
  Cat({required this.name, this.age = 1, this.verbose = false});
  
  void describe() {
    print('I\'m a cat with name ${name}, age: ${age} and verbosity: ${verbose}');
  }
}