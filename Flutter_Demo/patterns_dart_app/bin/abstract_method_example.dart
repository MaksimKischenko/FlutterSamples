abstract class Animal {
  String get type;
}

class Cat extends Animal {
  @override
  String get type => 'Cat';
}

abstract class Creator {
  Animal create();
}

class CatCreator extends Creator {
  @override
  Animal create() => Cat();
}