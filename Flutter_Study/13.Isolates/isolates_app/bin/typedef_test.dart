import 'dart:async';


// typedef Calculate = int Function(int, int);

// int add(int a, int b) => a + b;
// int subtract(int a, int b) => a - b;

// void main() {
//   Calculate calculate = add; // Используем синоним Calculate для типа функции.
//   print(calculate(5, 3)); // Выведет 8
//   calculate = subtract; // Мы можем присвоить другую функцию с той же сигнатурой.
//   print(calculate(10, 2)); // Выведет 8
// }


// typedef StringList = List<String>;

// void main() {
//   StringList fruits = ['apple', 'banana', 'cherry'];
//   print(fruits); // Выведет ['apple', 'banana', 'cherry']
// }

// typedef VoidCallback = void Function();

// void performAction(VoidCallback action) {
//   action();
// }

// void main() {
//   VoidCallback greet = () {
//     print('Hello, world!');
//   };
//   performAction(greet); // Вызываем функцию обратного вызова greet.
// }




Future<void> main() async{
  final argument = _Argument<int>(
    dataHandler: (data) {
      Future.delayed(Duration(seconds: 1), ()=> print(data));
    }, 
    data: 100
  );
  await argument();
}

typedef DataHandler<T> = FutureOr<void> Function(
  T data,
);


class _Argument<T> {
  _Argument({
    required this.dataHandler,
    required this.data,
  });

  final DataHandler<T> dataHandler;

  final T data;

  FutureOr<void> call() => dataHandler(data);
}