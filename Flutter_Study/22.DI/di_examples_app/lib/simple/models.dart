//STEP1
//////////////////////////////////////////////////////////

class ExampleViewModel {

  final calculatorService = CalculatorService();

  void onPresseMe() {
    // ignore: avoid_print
    final result = calculatorService.calculate(1, 2, CalculatorServiceOperation.summ);
    print(result);
  }
}

class ExampleViewModel2 {

  final calculatorService = CalculatorService();

  void onPresseMe() {
    // ignore: avoid_print
    final result = calculatorService.calculate(1, 2, CalculatorServiceOperation.summ);
    print(result);
  }
}

enum CalculatorServiceOperation {summ}

class CalculatorService {

  final summator = Summator();
  int calculate(int a, int b, CalculatorServiceOperation operation) {
    if(operation == CalculatorServiceOperation.summ) {
      return summator.summ(a, b);
    } else {
      return 0;
    }
  }
}

class Summator {
  int summ(int a, int b) {
    return a+ b;
  }
}

//STEP2
//////////////////////////////////////////////////////////

abstract class ExampleAbstractViewModel {
  void onPressMe1();
  void onPressMe2();
}


class ExampleRealViewModel extends ExampleAbstractViewModel {
  @override
  void onPressMe1() {
    print('PRESS1');
  }

  @override
  void onPressMe2() {
    print('PRESS2');
  }
}