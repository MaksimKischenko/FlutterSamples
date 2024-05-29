enum CalculatorServiceOperationDi {summ}



abstract class CalculatorAbstractServiceOperation {
  int summ(int a, int b);
}

class CalculatorServiceDi {

  final CalculatorAbstractServiceOperation summator;

  const CalculatorServiceDi(this.summator);

  int calculate(int a, int b, CalculatorServiceOperationDi operation) {
    if(operation == CalculatorServiceOperationDi.summ) {
      return summator.summ(a, b);
    } else {
      return 0;
    }
  }
}

//полезно для написания тестов 
class SummatorDi implements CalculatorAbstractServiceOperation {

  const SummatorDi();

  @override
  int summ(int a, int b) {
    return a + b;
  }
}


/////////////////////////////////////////////////////////////////////////////////

enum CalculatorServiceOperationSecoond {summ}

class CalculatorServiceSecond {

  final SummatorSecond summatorSecond;

  const CalculatorServiceSecond(this.summatorSecond);


  int calculate(int a, int b, CalculatorServiceOperationSecoond operation) {
    if(operation == CalculatorServiceOperationSecoond.summ) {
      return summatorSecond.summ(a, b);
    } else {
      return 0;
    }
  }
}

class SummatorSecond {
  int summ(int a, int b) {
    return a + b;
  }
}


abstract class ExampleAbstractViewModelDI {
  void onPressMe1();
  void onPressMe2();
}


class ExampleRealViewModelDI extends ExampleAbstractViewModelDI {

  late final CalculatorServiceSecond calculatorServiceSecond;

  ExampleRealViewModelDI(this.calculatorServiceSecond);

  @override
  void onPressMe1() {
    print('PRESS1');
  }

  @override
  void onPressMe2() {
    print('PRESS2');
  }
}
