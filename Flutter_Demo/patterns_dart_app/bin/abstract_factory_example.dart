enum AnimalType {
  cat, dog, cow,
}

abstract interface class Animal {  
  factory Animal(AnimalType type) {
    switch (type) {
      case AnimalType.cat:
        return _Cat();
      case AnimalType.dog:
        return _Dog();
      case AnimalType.cow:
        return _Cow();
    }
  }
  
  String get type => 'Unknown';  
}


class _Cat implements Animal {
  @override
  String get type => 'Cat';
}

class _Dog implements Animal {
  @override
  String get type => 'Dog';
}

class _Cow implements Animal {
  @override
  String get type => 'Cow';
}
