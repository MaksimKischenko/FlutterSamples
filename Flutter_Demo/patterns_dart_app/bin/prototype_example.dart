class Cat {
  
  String? color;
  
  String? name;
  
  Cat._({this.color, this.name});
  
  factory Cat() {
    return Cat._();
  }
  
  Cat copyWith({String? color, String? name}) {
    final _newColor = color ?? this.color;
    final _newName = name ?? this.name;
    return Cat._(color: _newColor, name: _newName);
  }
}