import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';



String email = 'test@test.com'; 
String correctResult = '0'; 

void main(){

  group('validation check', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    test('validate email id', () {
      final fieldValidator = FieldValidator();
      var result = fieldValidator.validateEmail('');
      expect(result, 'Enter Email');
    });

    test('validate Password', () {
      final fieldValidator = FieldValidator();
      var result = fieldValidator.validatePassword('234567890467');
      expect(result, '');
    });
  });
}

class FieldValidator {
  String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Enter Email';
    }

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    if (!emailValid) {
      return 'Enter Valid Email';
    }
    return correctResult;
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Enter password';
    }

    if (value.length < 6) {
      return 'Password is too short';
    }
    return correctResult;
  }
}