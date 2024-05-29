// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'delegation_example.dart';

void main(List<String> arguments) {


  //1. КОНТЕЙНЕР СВОЙСТВ
  //final props = AnimalProperties<String>();
  //props['Age'] = '5';
  //props['#Test'] = 'Test';    // будет исключение InvalidKeyException
  //print(props['Age']);        // 5
  //print(props['Unknown']);    // будет исключение NoPropertyException

  //2. КАНАЛ СОБЫТИЙ
  // Age age = Age();
  // age.subscribe.listen((_newAge) {
  //   print('Age is changed to $_newAge');
  // });
  // age+1;			// Age is changed to 1
  // age+2;		  // Age is changed to 3

  //3. АБСТРАКТНАЯ ФАБРИКА
  // final myCat = Animal(AnimalType.cat);
  // print(myCat.type);

  //4. СТРОИТЕЛЬ
  // final cat = Cat(name: 'Panther')
  // ..age = 3
  // ..verbose = true;
  // cat.describe();

  //5. АБСТРАКТНЫЙ МЕТОД
  //print(CatCreator().create().type);

  //6. ЛЕНИВАЯ ИНИЦИАЛИЗАЦИЯ
  // final cat = Cat();
  // print(cat.age);

  //7. ОБЪЕКТНЫЙ ПУЛЛ
//   final pool1 = PooledDatabase();
//   print(pool1.hashCode);
//   final pool2 = PooledDatabase();
//   print(pool2.hashCode);
// //   final pool3 = PooledDatabase();   //выбросит исключение Not Enough Connections
//   PooledDatabase.release(pool2);
//   final pool4 = PooledDatabase();
//   print(pool4.hashCode);
//   assert(pool2==pool4);             //будет true, поскольку второе подключение из пула будет переиспользовано  
  
  //8. ПРОТОТИП
  // final defaultCat = Cat();
  // final ourCat = defaultCat.copyWith(color: 'red', name: 'Thunder');
  // print(ourCat.name);
  // print(ourCat.color);

  //9. СИНГЛИТОН
  // final log1 = Logger();
  // final log2 = Logger();
  // print(log1.hashCode);
  // print(log2.hashCode);


  //debug(Salad());
  final specialSalad = SpecialSalad();
  debug(specialSalad);
  // specialSalad.vip();

User admin = Admin(age: 100);
admin.showAge();
test(admin);

}

void test(User user) {

}



class User {
 final int age;

  const User({
    required this.age,
  });
 void showAge() {
  print('The age is: $age');
 }
}


class Admin extends User {

 Admin({required super.age});

}